using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this line is required to avoid the following error
            //WebForms UnobtrusiveValidationMode requires a ScriptResourceMapping for 'jquery'
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void cmdSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}