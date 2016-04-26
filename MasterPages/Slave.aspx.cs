using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.MasterPages
{
    public partial class Slave : System.Web.UI.Page
    {
        string result;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                result = "Hello World!";
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            lblHelloWorld.Text = result;
        }
    }
}