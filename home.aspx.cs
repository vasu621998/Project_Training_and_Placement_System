using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class adminhome : System.Web.UI.Page
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
                addnotice.Visible = true;
                search.Visible = true;
                findit.Visible = true;
                result.Visible = true;

            }
            else
            {
                Response.WriteFile("~/studentnav.html");
                addnotice.Visible = false;
                search.Visible = false;
                findit.Visible = false;
                result.Visible = false;

            }

            if (!IsPostBack)
                search.Text = (string)Session["what"];
      
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DateTime myDate = (DateTime)DataBinder.Eval(e.Row.DataItem, "exp_date");
                if (DateTime.Now > myDate)
                {
                    e.Row.Enabled = false;
                    e.Row.Visible = false;
                }
            }
        }

        protected Boolean isAllow(string role)
        {
            DatabaseEntities db = new DatabaseEntities();
            string curr_userid = (string)Session["user_id"];
            int nid = Int32.Parse(Request.QueryString["noticeid"]);
            var user = (from n in db.Notices where n.nid == nid select n.uuid).ToList();

            return (role == "admin" && curr_userid == user.ElementAt(0));
        }

        protected void findit_Click(object sender, EventArgs e)
        {
            string what = search.Text.ToLower();
            Session["what"] = what;
            if (what.Contains("("))
            {
                Session["whichcom"] = what;
                Response.Redirect("~/past.aspx");
            }
            Response.Redirect("~/home.aspx");
        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> mymethod(string prefixText)
        {
            DatabaseEntities db = new DatabaseEntities();
            List<string> list = new List<string>();
            string prefix = prefixText.ToLower();
            var user = (db.Users.Where(x => x.fname.ToLower().StartsWith(prefix))).ToList();
            foreach (var u in user)
            {
                list.Add(u.fname);
            }
            user = (db.Users.Where(x => x.mname.ToLower().StartsWith(prefix))).ToList();
            foreach (var u in user)
            {
                list.Add(u.mname);
            }
            user = (db.Users.Where(x => x.lname.ToLower().StartsWith(prefix))).ToList();
            foreach (var u in user)
            {
                list.Add(u.lname);
            }
            var com = (db.Companies.Where(x => x.cname.ToLower().StartsWith(prefixText.ToLower()))).ToList();

            
            foreach (var c in com)
            {
                list.Add(c.cname + " (Company)");
            }
            return list.Distinct().ToList();

        }

        protected void result_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string what = (string)Session["what"];
            DatabaseEntities db = new DatabaseEntities();
            if (e.Row.RowType == DataControlRowType.DataRow && what!=null)
            {
                result.Visible = true;
                Label uuid = (Label)e.Row.FindControl("Label1");
                Label fname = (Label)e.Row.FindControl("Label2");
                Label mname = (Label)e.Row.FindControl("Label3");
                Label lname = (Label)e.Row.FindControl("Label4");
                Image profile = (Image)e.Row.FindControl("profileimage");
                var us = (from u in db.Users where u.uuid == uuid.Text select u.imageurl).ToList();
                if (us.ElementAt(0) == "a")
                    profile.ImageUrl = "~/Images/default.png";
                else
                profile.ImageUrl = "~/Images/" + uuid.Text + ".jpg";

                if (fname.Text != null && mname.Text!=null && lname!=null)
                {
                    if (!fname.Text.ToLower().Contains(what) && !lname.Text.ToLower().Contains(what) && !mname.Text.ToLower().Contains(what))
                    {
                        e.Row.Visible = false;
                        e.Row.Enabled = false;
                    }
                }
            }
            if (what == null)
                result.Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow && what == null)
            {
                e.Row.Visible = false;
                e.Row.Enabled = false;
            }
        }

        protected void ViewPostDS_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}