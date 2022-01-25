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
    public partial class update_satus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];
            DatabaseEntities db = new DatabaseEntities();
            Session["db"] = db;

            if (curr_userid == null)
                Response.Redirect("~/index.aspx?msg=Please+login+first");
          //  Response.Write(curr_userrole + "Login");
            if (curr_userrole != "admin")
            {
                Response.Redirect("~/home.aspx?msg=Accessed+Denied");
            }
            Response.WriteFile("~/adminnav.html");



            msg.Text = (string)Request.QueryString["msg"];
             if (StudentList.Rows.Count != 0)
             {
                 export.Visible = true;
                 update.Visible = true;
                 final.Visible = true;
             }
             else
             {
                //msg.Text = "Numbers of students for selected company can be zero";
                export.Visible = false;
                update.Visible = false;
                 final.Visible = false;
             }/*
             if (visited.Rows.Count == 0)
                 msg.Text = "NO actice registration for any visited company";*/
            /*update.Visible = true;
            final.Visible = true;*/
        }

        protected void visited_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DatabaseEntities db = (DatabaseEntities)Session["db"];
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DateTime myDate = (DateTime)DataBinder.Eval(e.Row.DataItem, "visit_date");
                Label sid = (Label)e.Row.FindControl("sid");
                int ssid = Int32.Parse(sid.Text);
                var count = db.Registers.Count(x => ((x.active == "yes") && (x.sid == ssid)));
                
                //if (DateTime.Now < myDate || count == 0)
               /* if (count == 0)
                {

                    e.Row.Enabled = false;
                    e.Row.Visible = false;
                }*/
               

            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            List<string> listforsend = new List<string>();
            DatabaseEntities db = (DatabaseEntities)Session["db"];
            int sid= Int32.Parse(Request.QueryString["sid"]);
            Company com = giveMeCompany(sid);
            db.Companies.Attach(com);
            for (int i = 0;i < StudentList.Rows.Count; i++)
            {
                Status s = new Status();
                CheckBoxList chk = (CheckBoxList)StudentList.Rows[i].FindControl("isplaced");
                TextBox txtpack = (TextBox)StudentList.Rows[i].FindControl("package");
                Label uname = (Label)StudentList.Rows[i].FindControl("uname");
                if (chk.Items[0].Selected)
                {
                    s.placed = "yes";
                    s.package = Double.Parse(txtpack.Text);
                    s.palced_date = DateTime.Now;
                    listforsend.Add(uname.Text);
                }
                else if (final.Checked)
                {
                    s.placed = "no";
                }

                if(chk.Items[0].Selected || final.Checked)
                {
                    User us = giveMeUser(uname.Text);
                    db.Users.Attach(us);
                    
                    db.Status.Add(s);
                    us.Status.Add(s);
                    com.Status.Add(s);
                    int ssid =Int32.Parse((string)Request.QueryString["sid"]);

                    if (s.placed == "no")
                    {
                        var reg = (db.Registers.Where(x => x.uuid == us.uuid && x.sid == ssid)).FirstOrDefault();
                        if (reg != null)
                        {
                            reg.active = "no";
                        }
                    }
                    db.SaveChanges();
                }
            }
            try
            {
                sendmail(listforsend,com.cname);
            }
            catch (Exception)
            {

            }
            Response.Redirect("~/update_status.aspx?msg=Updated");
        }

        private void sendmail(List<string> listforsend,string cname)
        {
            string sender = (string)Application["sender_email"];
            string server = (string)Application["sender_server"];
            DatabaseEntities db = new DatabaseEntities();
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(sender);
            foreach(var u in listforsend)
            {
                var mailadd = (db.Users.Where(x => x.uuid == u)).FirstOrDefault();
                if(mailadd.email != null)
                mail.To.Add(new MailAddress(mailadd.email));   
            }
            mail.Subject = "Congratulations !! ";
            mail.Body = "You are selected for "+cname+" please contact for more deatails ...";
            SmtpClient smtp = new SmtpClient(server, 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new System.Net.NetworkCredential(sender, "ddit@123");
            smtp.Send(mail);
        }

        protected Company giveMeCompany(int sid)
        {
            DatabaseEntities db = (DatabaseEntities)Session["db"];
            var cid = from c in db.Companies join s in db.Schedules on c.cid equals s.cid where s.sid==sid select c;
           
            Company com = null;
            foreach (var c in cid)
            {
                com = c;
            }
            return com;
        }
        protected User giveMeUser(string uuid)
        {
            DatabaseEntities db = (DatabaseEntities)Session["db"];
            var user = from u in db.Users where u.uuid == uuid select u;
            User us = null;
            foreach(var u in user)
            {
                us = u;
            }
            return us;
        }
        protected void StudentList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int sid = Int32.Parse(Request.QueryString["sid"]);
            DatabaseEntities db = (DatabaseEntities)Session["db"];
            var schedule = from s in db.Schedules where s.sid == sid select s;
            Schedule sch = null;
            foreach (var s in schedule)
            {
                sch = s;
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtpack=(TextBox) e.Row.FindControl("package");
                txtpack.Text = sch.package.ToString();

            }
        }

        protected void export_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }
        private void ExportGridToExcel()
        {
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ClearContent();
                Response.ClearHeaders();
                Response.Charset = "";
                string FileName = "data" + DateTime.Now + ".xls";
                StringWriter strwritter = new StringWriter();
                HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = "application/vnd.ms-excel";
                Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
                StudentList.GridLines = GridLines.Both;
                StudentList.HeaderStyle.Font.Bold = true;
                StudentList.RenderControl(htmltextwrtter);
                Response.Write(strwritter.ToString());
                Response.End();
            }catch(Exception err) { }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }
    }
}