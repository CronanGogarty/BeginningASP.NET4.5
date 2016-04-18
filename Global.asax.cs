using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BeginningASP.NET4._5
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Application_EndRequest(object sender, EventArgs e)
        {
            Response.Write("<footer><hr />This page was served at " + DateTime.Now.ToString() + "</footer>");
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("CronanCookie");
            cookie.Value = "1234ABC";
            Response.Cookies.Add(cookie);
        }
    }
}