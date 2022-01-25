using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class add_company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];

            if (curr_userid == null)
                Response.Redirect("~/index.aspx?msg=Please+login+first");
            // Response.Write(curr_userrole + "Login");
            if (curr_userrole != "admin")
            {
                Response.Redirect("~/home.aspx?msg=Accessed+Denied");
            }
           // Response.WriteFile("~/adminnav.html");

            DatabaseEntities db = new DatabaseEntities();
            try
            {
                var id = db.Companies.Max(x => x.cid);
                Application["prev_cid"] = id;
            }
            catch (Exception )
            {
                Application["prev_cid"] = 0;
            }
        }

       
        protected void reset_Click(object sender, EventArgs e)
        {
            cname.Text = "";
            phone.Text = "";
            email.Text = "";
            add.Text = "";
            locations.Items.Clear();
            website.Text = "";
        }

        protected void adder_Click(object sender, EventArgs e)
        {
            ListItem l = new ListItem(add.Text, add.Text);
            locations.Items.Add(l);
            add.Text = "";
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            DatabaseEntities db = new DatabaseEntities();
            Company c = new Company();
            c.cname = cname.Text;
            c.phone = phone.Text;
            c.email = email.Text;
            c.website = website.Text;
            int next_cid = (int)Application["prev_cid"];
            next_cid++;
            
            
            for (int i = 0; i < locations.Items.Count; i++)
            {
                Location l = new Location();
                l.cid = next_cid;
                l.location1 = locations.Items[i].Text;
              //  Response.Write(l.cid + " " + l.location1 + "\n");
                db.Locations.Add(l);
                l.Company = c;
               
            }
            db.Companies.Add(c);
            db.SaveChanges();
        }
    }
}