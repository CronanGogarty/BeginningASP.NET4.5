using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.ValidationControls
{
    public partial class ValidationForm : System.Web.UI.Page
    {
        string result;

        protected void Page_Load(object sender, EventArgs e)
        {
            //this line is required to avoid the following error
            //WebForms UnobtrusiveValidationMode requires a ScriptResourceMapping for 'jquery'
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            //Page.Validate();
            if (Page.IsValid)
            {
                result = "Valid form was submitted";
                lblResult.Text = result;
            }
        }

        protected void vldReferrerCustomValidator_ServerValidate(object source, ServerValidateEventArgs e)
        {
            try
            {
                //interestingly...this code will not ensure the referrer code starts with 014
                //entering 777 will validate as true
                int val = Int32.Parse(e.Value.Substring(0, 3));
                if (val % 7 == 0)
                {
                    e.IsValid = true;
                }
                else
                {
                    e.IsValid = false;
                }
            }
            catch (Exception ex)
            {
                // An error occurred in the conversion.
                // The value is not valid.
                e.IsValid = false;
                System.Diagnostics.Debug.Print(ex.Message);
            }
        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            result = "Form was cancelled";
        }
    }
}