using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5
{
    public partial class WebFormPageLifecycle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Log("<< Page_Load >>");
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            // When the Page.PreRender event occurs, it is too late
            // to change the list.
            Log("-- Page_PreRender --");
        }

        protected void CtrlChanged(object sender, EventArgs e)
        {
            string ctrlName = ((Control)sender).ID;
            Log(ctrlName + " Changed");
        }

        private void Log(string entry)
        {
            ListBox1.Items.Add(entry);

            //move to the bottom of the list to ensure that logged items are added at the bottom.
            ListBox1.SelectedIndex = ListBox1.Items.Count - 1;
        }
    }
}