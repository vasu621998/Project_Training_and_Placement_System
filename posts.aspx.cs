using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class viewposts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];
            if (curr_userid == null)
                Response.Redirect("~/index.aspx?msg=Please+login+first");
            // Response.Write(curr_userrole+"Login");
                msg.Text = (string)Request.QueryString["msg"];
            if (curr_userrole == "admin")
            {

                Response.WriteFile("~/adminnav.html");
            }
            else
            {
                Response.WriteFile("~/studentnav.html");
            }
            if (!IsPostBack)
            {
                DatabaseEntities db = new DatabaseEntities();
                var c = db.Status.Count(x => x.uuid == curr_userid);
                writepost.Visible = (c != 0);
                
            }
            
        }

        protected Boolean isAllow(string role)
        {
            DatabaseEntities db = new DatabaseEntities();
            string curr_userid = (string)Session["user_id"];
            int pid = Int32.Parse(Request.QueryString["postid"]);
            var user = (from p in db.Posts where p.pid == pid select p.uuid).ToList();

            return (role == "student" && curr_userid == user.ElementAt(0));
        }
      
        protected void posts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (Request.QueryString["postby"] != null)
            {
                string user = (string)Request.QueryString["postby"];
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    Label postby = (Label)e.Row.FindControl("postby");
                    if (user != postby.Text)
                    {
                        e.Row.Visible = false;
                        e.Row.Enabled = false;
                    }
                }
            }
        }
    }
}