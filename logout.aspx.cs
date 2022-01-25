using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_and_Placement_Portal
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //all clear
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("~/index.aspx?msg=Successfully+logged+out");
        }
    }
}