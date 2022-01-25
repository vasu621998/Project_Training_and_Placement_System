using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Training_and_Placement_Portal
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["prev_id"] = 0;
            Application["total_user"] = 0;
            Application["sender_email"] = "tpp.project123@gmail.com";
            Application["sender_server"] = "smtp.gmail.com";
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application["total_user"] = (int)Application["total_user"] + 1;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application["total_user"] = (int)Application["total_user"] - 1;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}