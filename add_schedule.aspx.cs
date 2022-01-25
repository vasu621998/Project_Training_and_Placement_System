using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class add_schedule : System.Web.UI.Page
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

          /*  DatabaseEntities db = new DatabaseEntities();
            var company = from c in db.Companies select c;
           // cid.Items.Clear();
            foreach (var c in company)
            {
                ListItem l = new ListItem(c.cname + " (" + c.cid + ")", c.cid.ToString());
                cid.Items.Add(l);
            }*/
           
        }

        protected void submit_Click(object sender, EventArgs e)
        {
          //  int curr_com = Int32.Parse(cid.Text);
            DatabaseEntities db = new DatabaseEntities();
            var com = (from c in db.Companies where c.cname.ToLower() == cid.Text.ToLower() select c).ToList();
            Company par=null;
            foreach (var c in com)
            {
                par = (Company)c;
            }
            Schedule s = new Schedule();
            s.cid = par.cid;
            s.package = Double.Parse(pack.Text);
            string date = visit_date.Text;
            int day = Int32.Parse(date.Substring(0, 2));
            int mon = Int32.Parse(date.Substring(3, 2));
            int year = Int32.Parse(date.Substring(6, 4));
            try
            {
                s.visit_date = new DateTime(year, mon, day);
                date = deadline.Text;
                day = Int32.Parse(date.Substring(0, 2));
                mon = Int32.Parse(date.Substring(3, 2));
                year = Int32.Parse(date.Substring(6, 4));
                s.deadline = new DateTime(year, mon, day);
            }
            catch(Exception)
            {
                Response.Redirect("~/add_schedule.aspx?msg=Invalid+date+format");
            }
            s.min_cpi = Double.Parse(min_cpi.Text);
            s.backlog = backlog.SelectedValue;
            s.vacancy = Int32.Parse(vac.Text);
            s.hrname = hrname.Text;
            s.description = des.Text;

            db.Companies.Attach(par);
            db.Schedules.Add(s);
            par.Schedules.Add(s);
            db.SaveChanges();
            Response.Write("Done");
            doit();
            
        }

       
        private void doit()
        {
                Session["n_cname"] = cid.Text;
                Session["n_pack"] = pack.Text;
                Session["n_visit"] = visit_date.Text;
                Session["n_deadline"] = deadline.Text;
                Response.Redirect("~/add_notice.aspx");
                //gen_notice.Visible = true;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> mymethod(string prefixText)
        {
            DatabaseEntities db = new DatabaseEntities();
            List<string> list = new List<string>();
            string prefix = prefixText.ToLower();
            var com = (from c in db.Companies where c.cname.ToLower().Contains(prefix) select c.cname).ToList();

            return com;

        }
    }
}