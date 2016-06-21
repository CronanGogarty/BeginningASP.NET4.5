using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BeginningASPNET45Components;

namespace BeginningASP.NET4._5.Components
{
    public partial class SimpleConsumeComponent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this line is required to avoid the following error
            //WebForms UnobtrusiveValidationMode requires a ScriptResourceMapping for 'jquery'
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            SimpleComponentClass class1 = new SimpleComponentClass();
            lblConsumeSimpleComponent.Text = class1.GetInfo("input string...");
        }

        protected void cmdGetInt_Click(object sender, EventArgs e)
        {
            int input = Int32.Parse(txtInputInt.Text);
            lblConsumeSimpleComponent.Text = "You entered " + input.ToString() + "\nThis was multiplied by 3 resulting in; " + SimpleComponentClass.GetStaticInt(input);
        }
    }
}