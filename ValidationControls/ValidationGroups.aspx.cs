using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.ValidationControls
{
    public partial class ValidationGroups : System.Web.UI.Page
    {
        string output;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            lblOutput.Text = output;
        }

        protected void vldFirstNameCustomValidator_ServerValidate(object source, ServerValidateEventArgs e)
        {
            customStringLengthVAlidation(e);
        }

        protected void vldLastNameCustomValidator_ServerValidate (object source, ServerValidateEventArgs e)
        {
            customStringLengthVAlidation(e);
        }

        private void customStringLengthVAlidation(ServerValidateEventArgs e)
        {
            try
            {
                string input = txtFirstName.Text;
                if (input.Length < 2)
                {
                    e.IsValid = false;
                }
                else
                {
                    e.IsValid = true;
                }
            }
            catch (NullReferenceException ex)
            {
                e.IsValid = true;
                System.Diagnostics.Debug.Print(ex.Message);
                output += "Exception handled: " + ex.Message;
            }
        }

        protected void cmdValidateName_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            output = "Valid form was submitted";
        }

        protected void cmdValidateEmail_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            output = "Valid form was submitted";
        }
    }
}