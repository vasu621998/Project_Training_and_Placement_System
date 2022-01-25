using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];
            if (curr_userid != null)
                Response.Redirect("~/home.aspx");

            msg.Text = Request.QueryString["msg"];
            msg.ForeColor = System.Drawing.Color.Green;
        }

        protected void login_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();
            var login = from u in db.Users where u.uuid == uname.Text && u.password == pwd.Text select u;
           
            
            foreach (var u in login)
            {
                Session["user_id"] = u.uuid;
                Session["user_role"] = u.role;
                Session["user_active"] = u.active;
               
                Response.Redirect("~/home.aspx");
            }
            msg.Text = "Invalid Username or Password";
            msg.ForeColor = System.Drawing.Color.Red;
        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/register.aspx");
        }
    }
}