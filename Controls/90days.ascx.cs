using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.UserControls
{
    public partial class _90days : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strOutput = "90 days from today will be: ";
            strOutput += DateTime.Today.AddDays(90).ToShortDateString();
            lbl90daysHence.Text = strOutput;
        }
    }
}