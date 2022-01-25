using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];
            
            if (curr_userid == null)
                Response.Redirect("~/index.aspx?msg=Please+login+first");
            // Response.Write(curr_userrole+"Login");
            msg.Text = (string)Request.QueryString["msg"];

            string whichuser = (string)Request.QueryString["whichuser"];
            newimage.Visible = false;
            upload.Visible = false;
            if (curr_userrole == "admin")
            {
                Response.WriteFile("~/adminnav.html");
            }
            else
            {
                Response.WriteFile("~/studentnav.html");
            }
            view.Visible = false;
            if (whichuser == null)
            {
                whichuser = curr_userid;
                view.Visible = true;
                newimage.Visible = true;
                upload.Visible = true;
            }
            if (whichuser.Contains("admin"))
            {
                student.Visible = false;
                admin.Visible = true;
            }
            else
            {
                student.Visible = true;
                admin.Visible = false;
            }
            msg.Text = whichuser;
            msg.Visible = false;
            mes.Text = Request.QueryString["msg"];
            if (!IsPostBack)
            {
                DatabaseEntities db = new DatabaseEntities();
                var us = (from u in db.Users where u.uuid == whichuser select u.imageurl).ToList();
                if (us.ElementAt(0) == "a")
                    profileimage.ImageUrl = "~/Images/default.png";
                else
                    profileimage.ImageUrl = "~/Images/" + whichuser + ".jpg";
            }
            //  bindData(curr_userid);
            if (whichuser.Equals(curr_userid))
                change.Visible = true;
            else
                change.Visible = false;


            if (!IsPostBack)
            {
                DatabaseEntities db = new DatabaseEntities();
                var pla = (from s in db.Status join c in db.Companies on s.cid equals c.cid where s.uuid == whichuser && s.placed == "yes" select c.cname).ToList();
                if (pla.Count != 0)
                    placedmes.Text = whichuser + " is placed at " + pla.ElementAt(0);
                else
                    placedmes.Text = "";
                if (curr_userrole == "admin")
                    viewregistered.Visible = false;
                else
                    viewregistered.Visible = true;
            }
        }

      
        protected void details_DataBound(object sender, EventArgs e)
        {
            //DataRowView dataRow = ((DataRowView)details.DataItem);
           
            Label doblbl = (Label)details.FindControl("dobLabel");
            TextBox dobtxt = (TextBox)details.FindControl("dobTextBox");
            DatabaseEntities db = new DatabaseEntities();
           
            if(doblbl!=null)
            doblbl.Text = doblbl.Text.Substring(0, 10);
            if (dobtxt != null)
             dobtxt.Text = dobtxt.Text.Substring(0, 10);

        }
        protected void FormView1_DataBound(object sender, EventArgs e)
        {
            Label doblbl = (Label)details.FindControl("dobLabel");
            TextBox dobtxt = (TextBox)details.FindControl("dobTextBox");

            if (doblbl != null)
                doblbl.Text = doblbl.Text.Substring(0, 10);
            if (dobtxt != null)
                dobtxt.Text = dobtxt.Text.Substring(0, 10);

        }
        protected void upload_Click(object sender, EventArgs e)
        {
            string curr_userid = (string)Session["user_id"];
            DatabaseEntities db = new DatabaseEntities();
            var us = (from u in db.Users where u.uuid == curr_userid select u).ToList();
           
            if (newimage.HasFile)
            {
                try
                {
                    string filename = curr_userid + ".jpg";
                    File.Delete(Server.MapPath("~/Images/") + filename);
                    newimage.SaveAs(Server.MapPath("~/Images/") + filename);
                    //Response.Write("Upload status: File uploaded!");
                    //u.imageurl = Server.MapPath("~/Images/") + filename;
                    /* ~/Images/userid.jpg */
                   
                    profileimage.ImageUrl = "~/Images/" + curr_userid + ".jpg";
                    us.ElementAt(0).imageurl= "~/Images/" + curr_userid + ".jpg"; ;
                    db.SaveChanges();
                    Response.Redirect("~/profile.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write("Upload status: The file could not be uploaded. please try again ");
                }
            }
        }
        protected Boolean isAllow()
        {
            return (((string)Request.QueryString["whichuser"] == (string)Session["user_id"]) || (string)Request.QueryString["whichuser"] == null);
        }

        protected void postby_Click(object sender, EventArgs e)
        {
            string whichuser = (string)Request.QueryString["whichuser"];
            if (whichuser == null)
                whichuser = (string)Session["user_id"];

            Response.Redirect("~/posts.aspx?postby=" + whichuser);
        }

        
    }
}