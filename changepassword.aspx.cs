using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];

            if (curr_userid != null)
            {
                idnotfound.Visible = true;
            }
            else
            {
                string insession = (string)Session["for_change_pwd"];
                string inrequest = (string)Request.QueryString["varify"];
                if (insession == null)
                    insession = "invalid";
                if (insession != inrequest || inrequest == null)
                {
                    Response.Redirect("~/index.aspx?msg=invalid+link");
                }
                else
                idnotfound.Visible = false;
            }
            msg.Text = Request.QueryString["msg"];
        }

        protected void change_Click(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];

            DatabaseEntities db = new DatabaseEntities();

            if (curr_userid != null)
            {
                var user = (from u in db.Users where u.uuid == curr_userid select u).FirstOrDefault();
                //string qa = que.SelectedValue + "_" + ans.Text;
                if (currpwd.Text != user.password)
                {
                    Response.Redirect("~/changepassword.aspx?msg=invalid+password");
                }
                else if (newpwd1.Text != newpwd2.Text)
                    Response.Redirect("~/changepassword.aspx?msg=password+not+matched");
                else
                {
                    user.password = newpwd1.Text;
                    db.SaveChanges();
                    Response.Redirect("~/profile.aspx?msg=Password+changed+successfully");
                }
            }
            else
            {
                string uid=(string) Session["user_for_change"];
                var user = db.Users.FirstOrDefault(x => x.uuid == uid);
                if (user == null)
                {
                    Response.Redirect("~/index.aspx?msg=something+wrong");
                }
                else if (newpwd1.Text != newpwd2.Text)
                    Response.Redirect("~/changepassword.aspx?msg=password+not+matched");
                else
                {
                    user.password = newpwd1.Text;
                    db.SaveChanges();
                    Response.Redirect("~/index.aspx?msg=Password+changed+successfully");
                }
                //Session.Clear();
            }    

        }
    }
}