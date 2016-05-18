using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace BeginningASP.NET4._5.Security
{
    public partial class Fundamentals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = User.Identity.Name;
            lblResult.Text = "Welcome " + username;
        }

        protected void cmdLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}