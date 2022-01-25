using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class register_for_company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userid = (string)Session["user_id"];
            string curr_userrole = (string)Session["user_role"];
            string curr_active = (string)Session["user_active"];
            if (curr_userid == null)
                Response.Redirect("~/index.aspx?msg=Please+login+first");
           // Response.Write(curr_userrole + "Login");
           if(curr_active.ToLower() != "yes")
               Response.Redirect("~/home.aspx?msg=Account+not+active");
            if (curr_userrole == "admin")
            {

                Response.WriteFile("~/adminnav.html");
                click.Visible = true;
                capcap.Visible = false;
            }
            else
            {
                Response.WriteFile("~/studentnav.html");
                click.Visible = false;
                capcap.Visible = true;

                Boolean placed = false;
                DatabaseEntities db = new DatabaseEntities();
                var status = from s in db.Status where s.uuid == curr_userid select s.placed;

                msg.Text = Request.QueryString["msg"];
                if (msg.Text == "Done")
                    msg.Text = "Successfully registered <a href='myregistered.aspx'>Show</a> My Registrations";
                foreach (var s in status)
                {
                    if (s.ToLower() == "yes")
                    {
                        placed = true;
                        msg.Text = "You are already placed so you can not register now so register button will not be visible !";
                    }
                }
                register.Visible = false;
                capcap.Visible = false;
                if (Request.QueryString["cid"] != null && !placed)
                {
                    int cid = Int32.Parse(Request.QueryString["cid"]);
                    int sid = Int32.Parse(Request.QueryString["sid"]);
                    msg.Text += "<br />If you are aligible for selected company then register button is visible";

                    var user = (from u in db.Users where u.uuid == curr_userid select u);
                    User current_user = null;
                    foreach (var u in user)
                    {
                        current_user = u;
                    }
                    var schedule = from s in db.Schedules where s.sid == sid select s;
                    Schedule current_schedule = null;
                    foreach (var s in schedule)
                    {
                        current_schedule = s;
                    }
                    if ((current_schedule.backlog.ToLower() == "no" && current_user.backlog.ToLower() == "yes") || current_user.cpi < current_schedule.min_cpi || placed || current_schedule.deadline < DateTime.Now)
                    {
                        register.Visible = false;
                        capcap.Visible = false;
                    }
                    else
                    {
                        register.Visible = true;
                        capcap.Visible = true;
                    }
                   // Response.Write(cid + " " + sid);
                }
            }
            if (Request.QueryString["sid"] == null)
                deatailspanel.Visible = false;
            else
                deatailspanel.Visible = true;

            if (!IsPostBack)
                fillit();
        }

        protected void upcoming_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DateTime myDate = (DateTime)DataBinder.Eval(e.Row.DataItem, "visit_date");
                if (DateTime.Now > myDate)
                {
                    e.Row.Enabled = false;
                    e.Row.Visible = false;
                }
            }
        }


        protected void register_Click(object sender, EventArgs e)
        {
            
            int cid = Int32.Parse(Request.QueryString["cid"]);
            int sid = Int32.Parse(Request.QueryString["sid"]);

            if ((string)Session["ImgValue"] != hiscap.Text)
                Response.Redirect("~/upcoming_companies.aspx?cid="+cid+"&sid="+sid+"&msg=wrong+captcha");

            string curr_user = (string)Session["user_id"];
            DatabaseEntities db = new DatabaseEntities();
            var register = (from r in db.Registers where r.sid == sid && r.uuid == curr_user select r).ToList();
            string url = "~/upcoming_companies.aspx?cid=" + cid + "&sid=" + sid;
            foreach (var r in register)
            {
                Response.Redirect(url + "&msg=You+already+registered+for+this+company");
            }
            var user = (from u in db.Users where u.uuid == curr_user select u).ToList();
            User us = null;
            foreach (var u in user)
            {
                us = u;
            }
            var schedule = (from s in db.Schedules where s.sid == sid select s).ToList();
            Schedule sch = null;
            foreach (var s in schedule)
            {
                sch = s;

            }
            if (sch.deadline < DateTime.Now)
            {
                Response.Redirect(url + "&msg=You+can+not+register+after+deadline");
            }
            
            Register reg = new Register();
            reg.active = "yes";
            db.Users.Attach(us);
            db.Schedules.Attach(sch);
            db.Registers.Add(reg);
            us.Registers.Add(reg);
            sch.Registers.Add(reg);
            db.SaveChanges();
            Response.Redirect("~/upcoming_companies.aspx?msg=Done");
           // Response.Write();
        }
        protected Boolean isAllow(string role)
        {
            string curr_userrole = (string)Session["user_role"];
            return (curr_userrole == "admin");
        }

        protected void recap_Click(object sender, EventArgs e)
        {
            fillit();
        }
        protected void fillit()
        {
            Random rdm = new Random();
            string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcde";
            StringBuilder ImgValue = new StringBuilder();
            for (int i = 0; i < 5; i++)
            {
                ImgValue.Append(combination[rdm.Next(combination.Length)]);
                Session["ImgValue"] = ImgValue.ToString();
                cap.ImageUrl = "captcha.aspx?";
            }
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }
    }
}