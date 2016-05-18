using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.Caching
{
    public partial class OutputCaching : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDate.Text = "The current DateTime is: " + DateTime.Now.ToString();
        }
    }
}