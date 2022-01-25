using ExcelDataReader;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class add_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string curr_userrole = (string)Session["user_role"];
            string curr_userid = (string)Session["user_id"];
            if (curr_userid == null)
                Response.Redirect("~/index.aspx?msg=Please+login+first");

            if (curr_userrole == "admin")
            {
                Response.WriteFile("~/adminnav.html");
            }
            else
            {
                Response.WriteFile("~/studentnav.html");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //OpenFileDialog ope = OpenFileDialog();
                if (FileUpload1.HasFile && Path.GetExtension(FileUpload1.FileName) == ".xlsx")
                {
                    string s = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/") + s);
                    FileStream stream = new FileStream(Server.MapPath("~/") + s, FileMode.Open);
                    IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);

                    int i = 0;
                    while (excelReader.Read())
                    {
                        DatabaseEntities db = new DatabaseEntities();
                        User usr = new User()
                        {

                            uuid = Convert.ToString(excelReader.GetValue(i)),
                            fname = Convert.ToString(excelReader.GetValue(i + 1)),
                            mname = Convert.ToString(excelReader.GetValue(i + 2)),
                            lname = Convert.ToString(excelReader.GetValue(i + 3)),
                            mobile = Convert.ToString(excelReader.GetValue(i + 4)),
                            email = Convert.ToString(excelReader.GetValue(i + 5)),
                            dob = Convert.ToDateTime(excelReader.GetValue(i + 6)),
                            rollno = Convert.ToString(excelReader.GetValue(i + 7)),
                            password = Convert.ToString(excelReader.GetValue(i + 8)),
                            role = Convert.ToString(excelReader.GetValue(i + 9)),
                            batch = Convert.ToString(excelReader.GetValue(i + 10)),
                            bid = myBranchID(excelReader.GetValue(i + 11).ToString())

                        };

                        db.Users.Add(usr);
                        db.SaveChanges();

                    }
                    i = i + 12;
                }
                Label1.Text = "Users sucessfully added!";
            }
            catch (Exception err)
            {
                Label1.Text = "<font color='red'>Something went wrong! Try again.</font>";
                //Response.Write(err);
            }

        }
        public int myBranchID(string value)
        {
            DatabaseEntities db = new DatabaseEntities();
            var a = from b in db.Branches where b.bname.ToString() == value.ToString().StartsWith(b.bname + "").ToString() select b;
            foreach (var b in a)
            {
                return Int32.Parse(b.bid.ToString());
            }
            return 1;
        }
    }
}