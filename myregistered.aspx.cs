using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class myregistered : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];

            if (curr_userrole == "admin")
            {
                Response.Redirect("~/home.aspx");
            }
            if (curr_userid == null)
                Response.Redirect("~/index.aspx?msg=Please+login+first");

            Response.WriteFile("~/studentnav.html");
            if (Request.QueryString["rid"] == null)
                view.Visible = false;
            else
                view.Visible = true;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string curr_userid = (string)Session["user_id"];
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string curr = (string)DataBinder.Eval(e.Row.DataItem, "uuid");
                if (curr != curr_userid)
                {
                    e.Row.Enabled = false;
                    e.Row.Visible = false;
                }
            }
        }
        protected Boolean isVisible()
        {
            string curr_userid = (string)Session["user_id"];
            int rid = Int32.Parse(Request.QueryString["rid"]);
            DatabaseEntities db = new DatabaseEntities();
            var register = (from r in db.Registers join s in db.Schedules on r.sid equals s.sid where r.rid==rid select s.deadline).ToList();

            return (DateTime.Now <= (DateTime)register.First());
        }

        protected void FormView1_DataBound(object sender, EventArgs e)
        {
            LinkButton lb=(LinkButton)FormView1.FindControl("DeleteButton");
            if(lb !=null)
            lb.Visible = isVisible();
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            Response.Redirect("~/myregistered.aspx");
        }
    }
}