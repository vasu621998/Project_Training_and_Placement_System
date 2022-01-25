using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class add_branch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];

            if (curr_userid == null)
                Response.Redirect("~/index.aspx?msg=Please+login+first");
          //  Response.Write(curr_userrole + "Login");
            if (curr_userrole != "admin")
            {
                Response.Redirect("~/home.aspx?msg=Accessed+Denied");
            }
            Response.WriteFile("~/adminnav.html");
            
            msg.Text = Request.QueryString["msg"];
           
        }

        protected void add_Click(object sender, EventArgs e)
        {
            msg.ForeColor = System.Drawing.Color.Red;
            DatabaseEntities db = new DatabaseEntities();
            string bnm = bname.Text;
            var branch = from br in db.Branches where br.bname == bnm select br.bname;
            foreach (var br in branch)
            {
               
                Response.Redirect("~/add_branch.aspx?msg=Branch+already+exists");
            }
            Branch b = new Branch();
            b.bname = bname.Text.ToUpper();
            b.hod = hod.Text.ToUpper();
            db.Branches.Add(b);
            db.SaveChanges();
            msg.ForeColor = System.Drawing.Color.Green;
            Response.Redirect("~/add_branch.aspx?msg=Branch+added");
        }
    }
}