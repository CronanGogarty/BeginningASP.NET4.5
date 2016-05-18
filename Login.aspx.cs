using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace BeginningASP.NET4._5
{
    public partial class Login : System.Web.UI.Page
    {
        private string result;

        protected void Page_Load(object sender, EventArgs e)
        {
            //this line is required to avoid the following error
            //WebForms UnobtrusiveValidationMode requires a ScriptResourceMapping for 'jquery'
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            result += "FormsAuthentication.FormsCookieName = " + FormsAuthentication.FormsCookieName.ToString();
            result += "<br />FormsAuthentication.FormsCookiePath = " + FormsAuthentication.FormsCookiePath.ToString();

            lblResult.Text = result;

        }

        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text == "secret")
            {
                if (chkPersistentLogin.Checked)
                {
                    //set a persistent cookie

                    //set the timespan for 14 days
                    int timespan = (int)TimeSpan.FromDays(14).TotalMinutes;

                    //create an authentication ticket
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(txtUserName.Text, true, timespan);

                    //encrypt the ticket
                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);

                    //create and populate the cookie
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    cookie.Expires = ticket.Expiration;

                    // Attach the cookie to the current response. 
                    //It will now travel back to the client, and then back to the web server with every new request.
                    HttpContext.Current.Response.Cookies.Set(cookie);

                    Response.Redirect(FormsAuthentication.GetRedirectUrl(txtUserName.Text, false), true);

                }
                else
                {
                    FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, false);
                }
                
            }
            else
            {
                lblResult.Text = "Password must be \"secret\"";
            }
        }
    }
}