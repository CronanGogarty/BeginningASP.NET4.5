using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.ValidationControls
{
    public partial class SimpleValidation : System.Web.UI.Page
    {
        string output;

        protected void Page_Load(object sender, EventArgs e)
        {
            //this line is required to avoid the following error
            //WebForms UnobtrusiveValidationMode requires a ScriptResourceMapping for 'jquery'
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            lblResult.Visible = true;
            lblResult.Text = output;
        }

        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            //if the page is not in a valid state abort the event code
            if (!Page.IsValid) return;

            try
            {
                output = "You submitted a form.";
                output += "<br />Textbox 1 contained: " + txtNumberRange.Text.ToString();
                output += "<br />Textbox 2 contained: " + txtValidWord.Text.ToString();
            }
            catch (InvalidCastException ex)
            {
                System.Diagnostics.Debug.Print(ex.ToString());
                output = ex.Message.ToString();
            }
            
        }
    }
}