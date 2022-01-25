using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class add_notice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];

            if (curr_userid == null)
                Response.Redirect("~/index.aspx?msg=Please+login+first");
           // Response.Write(curr_userrole + "Login");
            if (curr_userrole != "admin")
            {
                Response.Redirect("~/home.aspx?msg=Accessed+Denied");
            }
            

            uuid.Text = curr_userid;
            notice_date.Text = DateTime.Now.ToString().Substring(0,10);
            submit.Text = "Add Notice";
            DateTime d = DateTime.Now;
            int y = d.Year;
            for (int i = 2; i >= 0; i--)
            {
                ListItem l = new ListItem((y - i).ToString(), (y - i).ToString());
                batch.Items.Add(l);
            }
            if (Session["n_cname"] != null)
                doit();
            
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string curr_user = (string)Session["user_id"];
            DatabaseEntities db = new DatabaseEntities();
            var user = (from u in db.Users where u.uuid == curr_user select u).ToList();
            User par = null;
            foreach (var u in user)
            {
                par = u;
            }
            Notice n = new Notice();
            n.title = title.Text;
            n.description = des.Text;
            string date = exp_date.Text;
            int day = Int32.Parse(date.Substring(0, 2));
            int mon = Int32.Parse(date.Substring(3, 2));
            int year = Int32.Parse(date.Substring(6, 4));
            n.exp_date = new DateTime(year, mon, day);
            n.notice_date = DateTime.Now;

            db.Users.Attach(par);
            db.Notices.Add(n);
            par.Notices.Add(n);
            db.SaveChanges();
            Response.Write("Done");
            try
            {
                if (CheckBoxList1.Items[0].Selected)
                    sendmail();
            }
            catch (Exception)
            {
                Response.Redirect("~/home.aspx?msg=notice+added+but+mail+not+sent+due+to+some+error");
            }
            Response.Redirect("~/home.aspx?msg=notice+added");
        }
       
        private void doit()
        {
          //  Response.Write("here");
            string gen_title = "About upcoming company " + (string)Session["n_cname"];
            string gen_des = "Visit Date : " + (string)Session["n_visit"] + "\nDeadline for registration : " + (string)Session["n_deadline"] 
                                + "\nOffered Package : " + (string)Session["n_pack"];
            title.Text = gen_title;
            des.Text = gen_des;
            
            Session["n_cname"] = null;
            Session["n_pack"] = null;
            Session["n_visit"] = null;
            Session["n_deadline"] = null;

        }
        private void sendmail()
        {
            string sender = (string)Application["sender_email"];
            string server = (string)Application["sender_server"];
            DatabaseEntities db = new DatabaseEntities();
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(sender);
            for (int i = 0; i < batch.Items.Count; i++)
            {
                if (batch.Items[i].Selected)
                {
                    string s = batch.Items[i].Value;
                    var mails = (from u in db.Users where u.batch == s select u.email).ToList();
                    foreach (var m in mails)
                    {
                        mail.To.Add(new MailAddress(m.ToString()));
                    }
                }
            }
            mail.Subject = title.Text;
            mail.Body = des.Text;
            SmtpClient smtp = new SmtpClient(server, 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new System.Net.NetworkCredential(sender, "ddit@123");
            smtp.Send(mail);
        }
    }
}