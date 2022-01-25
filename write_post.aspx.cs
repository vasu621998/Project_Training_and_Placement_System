using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class write_post : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            uuid.Text = (string)Session["user_id"];
            post_date.Text = DateTime.Now.ToString();

            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];
            if (curr_userid == null)
                Response.Redirect("~/index.aspx?msg=Please+login+first");
            if (curr_userrole == "admin")
            {
                Response.Redirect("~/add_notice.aspx?msg=add+notice+here");
            }
            else {
               // Response.WriteFile("~/studentnav.html");
            }
            DatabaseEntities db = new DatabaseEntities();
            var c = db.Status.Count(x => x.uuid == curr_userid);
            if (c == 0)
                Response.Redirect("~/home.aspx?msg=access+denied");
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
            Post p = new Post();
            p.title = title.Text;
            p.description = des.Text;
            p.post_date = DateTime.Now;

            db.Users.Attach(par);
            db.Posts.Add(p);
            par.Posts.Add(p);
            db.SaveChanges();
            Response.Write("Done");
        }

        protected void dismiss_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/home.aspx");
        }
    }
}