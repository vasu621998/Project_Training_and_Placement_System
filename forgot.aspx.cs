using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class forgot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];

            if (!IsPostBack)
                select.RepeatDirection = RepeatDirection.Horizontal;

            if (curr_userid != null)
                Response.Redirect("~/home.aspx");
            else
                msg.Text = Request.QueryString["msg"];

        }

        protected void select_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (select.SelectedIndex == 0)
            {
                userid.Visible = true;
                password.Visible = false;
            }
            else
            {
                userid.Visible = false;
                password.Visible = true;
            }
        }

        protected void getid_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();
            string qa = que.SelectedValue + "_" + ans.Text;
            var user =( from u in db.Users where u.email == email.Text && u.security_q_a == qa select u).FirstOrDefault();
            if (user == null)
            {
                Response.Redirect("~/index.aspx?msg=User+not+exist");
            }
            else
            {
                try
                {
                    sendmail(user, true);
                }
                catch (Exception)
                {
                    Response.Redirect("~/index.aspx?msg=mail+not+sent+try+again");
                }
            }

        }
        private void sendmail(User u,bool userid)
        {
            string sender = (string)Application["sender_email"];
            string server = (string)Application["sender_server"];
            DatabaseEntities db = new DatabaseEntities();
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(sender);
            
            mail.To.Add(new MailAddress(u.email));
            if (userid)
            {
                mail.Subject = "Your UserID";
                mail.Body = "We Found your user id : " + u.uuid;
                Response.Write(mail.Body);
            }
            else
            {
                mail.Subject = "Change password link";
                string link = GetStr();
                Session["for_change_pwd"] = link;
                mail.Body = "http://localhost:51611/changepassword.aspx?varify=" + link;
            }
            SmtpClient smtp = new SmtpClient(server, 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new System.Net.NetworkCredential(sender, "ddit@123");
            smtp.Send(mail);
            Response.Redirect("~/index.aspx?msg=mail+sent");
        }

        private string GetStr()
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var stringChars = new char[15];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);
            return finalString;
        }

        protected void change_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();
            string qa = secque.SelectedValue + "_" + secans.Text;
            var user = (from u in db.Users where u.uuid == uid.Text && u.security_q_a==qa select u).FirstOrDefault();
            if (user == null)
            {
                Response.Redirect("~/index.aspx?msg=User+not+exist");
            }
            else
            {
                Session["user_for_change"] = user.uuid;
                try
                {
                    sendmail(user, false);
                }
                catch (Exception)
                {
                    Response.Redirect("~/index.aspx?msg=mail+not+sent+try+again");
                }
               // sendmail(user, false);
            }

        }
    }
}