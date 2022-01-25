using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class register : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];
            if (curr_userid != null)
                Response.Redirect("~/home.aspx");
            backlog.RepeatDirection = RepeatDirection.Horizontal;
            if (!IsPostBack)
            {
                DatabaseEntities db = new DatabaseEntities();
                var branches = from b in db.Branches select b;
                foreach (var b in branches)
                {
                    ListItem l = new ListItem(b.bname, (b.bid).ToString());
                    if (b.bid != 1)
                        branch.Items.Add(l);
                }
                var id = db.Users.Max(x => x.uid);
                Application["prev_id"] = id;
                //Response.Write(this.prev_id.ToString() + "\n");
                DateTime d = DateTime.Now;
                int y = d.Year;
                for (int i = 4; i >= 0; i--)
                {
                    ListItem l = new ListItem((y-i).ToString(), (y-i).ToString());
                    batch.Items.Add(l);
                }
            }
        }
        protected void res_Click(object sender, EventArgs e)
        {
            if ((string)Session["OTP"] != otp.Text || otp.Text == null)
                Response.Redirect("~/register.aspx?msg=Wrong+OTP");
            DatabaseEntities db = new DatabaseEntities();
            User u = new User();
            u.fname = fname.Text;
            u.mname = mname.Text;
            u.lname = lname.Text;

            u.mobile = mobile.Text;
            u.email = email.Text;
            string date = dob.Text;
            int day = Int32.Parse(date.Substring(0, 2));
            int mon = Int32.Parse(date.Substring(3, 2));
            int year = Int32.Parse(date.Substring(6, 4));
            u.dob = new DateTime(year, mon, day);
            u.bid = Int32.Parse(branch.SelectedValue);
            u.rollno = rollno.Text;
            u.cpi = Double.Parse(cpi.Text);
            u.backlog = backlog.SelectedValue;
            u.batch = batch.SelectedValue;
            u.security_q_a = que.SelectedValue + "_" + ans.Text;
            u.password = pwd.Text;
            DateTime d = DateTime.Now;
            int prev_id =(int) Application["prev_id"];
            prev_id++;
            string id = prev_id.ToString();
            id = id.PadLeft(4, '0');
            Response.Write("id is : " + id+"\n");
            u.role = "student";
            u.active = "yes";
            u.uuid = u.batch + branch.SelectedItem.Text + id;
            if (image.HasFile)
            {
                try
                {
                    string filename = u.uuid + ".jpg";
                    image.SaveAs(Server.MapPath("~/Images/") + filename);
                    //Response.Write("Upload status: File uploaded!");
                    u.imageurl = Server.MapPath("~/Images/") + filename;
                    /* ~/Images/userid.jpg */
                }
                catch (Exception ex)
                {
                    Response.Write("Upload status: The file could not be uploaded. The following error occured: " + ex.Message);
                }
            }
            else {
                try
                {
                    
                    string filename = u.uuid + ".jpg";
                    File.Copy(Server.MapPath("~/Images/Default.png"), Server.MapPath("~/Images/") + filename);
                   // image.SaveAs(Server.MapPath("~/Images/") + filename);
                    //Response.Write("Upload status: File uploaded!");
                    u.imageurl = Server.MapPath("~/Images/") + filename;
                    /* ~/Images/userid.jpg */
                }
                catch (Exception ex)
                {
                    Response.Write("Upload status: The file could not be uploaded. The following error occured: " + ex.Message);
                }
            }

           // Response.Write(u.security_q_a + "\n");
           // Response.Write(u.uuid + "\n");

            db.Users.Add(u);
            db.SaveChanges();
            sendmail("Successfully registered","Please remeber your user id : "+u.uuid);
            Response.Redirect("~/index.aspx?msg=Your+user+ID+is+"+u.uuid+"+Please+remeber+it.");
        }
        private void sendmail(string subject,string body)
        {
            string sender = (string)Application["sender_email"];
            string server = (string)Application["sender_server"];
            DatabaseEntities db = new DatabaseEntities();
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(sender);
            mail.To.Add(new MailAddress(email.Text));
            mail.Subject =  subject ;
            mail.Body = body;
            SmtpClient smtp = new SmtpClient(server, 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new System.Net.NetworkCredential(sender, "ddit@123");
            smtp.Send(mail);
        }
        private string GetStr()
        {
            var chars = "0123456789";
            var stringChars = new char[4];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);
            return finalString;
        }

        protected void email_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string OTP = GetStr();
                Session["OTP"] = OTP;

                sendmail("OTP for registration","Your OTP(one time password) is..." + OTP);
            }
            catch(Exception)
            {
                Response.Redirect("~/register.aspx?msg=invalid+email+or+OTP+can't+be+send");
            }
        }
    }
}