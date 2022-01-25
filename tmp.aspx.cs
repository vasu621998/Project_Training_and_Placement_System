using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Net.Mail;
using System.Text;

namespace Training_and_Placement_Portal
{
    public partial class tmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
                fillit();
        }

        protected void fillit()
        {
            Random rdm = new Random();
            string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            StringBuilder ImgValue = new StringBuilder();
            for (int i = 0; i < 5; i++)
            {
                ImgValue.Append(combination[rdm.Next(combination.Length)]);
                Session["ImgValue"] = ImgValue.ToString();
                cap.ImageUrl = "cap.aspx?";
            }
        }

        protected void recap_Click(object sender, EventArgs e)
        {
            fillit();
        }
    }
    
}
