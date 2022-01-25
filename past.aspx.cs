using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class past : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];

            if (curr_userid == null)
                Response.Redirect("~/index.aspx?msg=Please+login+first");
            // Response.Write(curr_userrole+"Login");
           
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
               // order.RepeatDirection = RepeatDirection.Horizontal;
                year.Text = DateTime.Now.Year.ToString();
                col.Visible = true;
                pie.Visible = false;
                Session["db"] = new DatabaseEntities();

                string whichcompany = (string)Session["whichcom"];
                if (whichcompany != null)
                {
                    string[] strs = whichcompany.Split(' ');
                    cname.Text = strs[0];
                    cname_TextChanged(sender, e);
                }
            }
        }

       
        protected void year_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void order_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (order.SelectedValue == "0")
                BranchYearASC_DS.SelectCommand = "SELECT * FROM [BranchwiseByYearView] WHERE ([batch] = @batch) ORDER BY [total]";
            else
                BranchYearASC_DS.SelectCommand = "SELECT * FROM [BranchwiseByYearView] WHERE ([batch] = @batch) ORDER BY [total] DESC";

            col.Visible = true;

        }

        protected void type_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (type.SelectedValue == "Column")
            {
                if (order.SelectedValue == "0")
                    BranchYearASC_DS.SelectCommand = "SELECT * FROM [BranchwiseByYearView] WHERE ([batch] = @batch) ORDER BY [total]";
                else
                    BranchYearASC_DS.SelectCommand = "SELECT * FROM [BranchwiseByYearView] WHERE ([batch] = @batch) ORDER BY [total] DESC";

                col.Visible = true;
                pie.Visible = false;
                order.Enabled = true;
            }
            else
            {
                BranchYearASC_DS.SelectCommand = "SELECT * FROM [BranchwiseByYearView] WHERE ([batch] = @batch) ORDER BY [total]";
                order.Enabled = false;
                pie.Visible = true;
                col.Visible = false;
            }

        }

        protected void cname_TextChanged(object sender, EventArgs e)
        {
            DatabaseEntities db = (DatabaseEntities)Session["db"];
            string nm = cname.Text.ToLower();
            var bid = (db.Companies.Where(x => x.cname.ToLower().Contains(nm))).ToList();
            hidden.Text = bid.ElementAt(0).cid.ToString();

        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetCompany(string prefixText)
        {
            DatabaseEntities db = new DatabaseEntities();
            var com = (db.Companies.Where(x => x.cname.ToLower().StartsWith(prefixText.ToLower()))).ToList();
            List<string> list = new List<string>();
            foreach (var c in com)
            {
                list.Add(c.cname);
            }
            return list;

        }
       

    }
}