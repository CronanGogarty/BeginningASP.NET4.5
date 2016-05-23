using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.Ajax
{
    public partial class BasicAjaxExample : System.Web.UI.Page
    {
        DateTime currentTime;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                currentTime = DateTime.Now;
                lblCurrentTime.Text = currentTime.ToLongTimeString();
            }
            
        }

        protected void cmdUpdateTime_Click(object sender, EventArgs e)
        {
            currentTime = DateTime.Now;
            lblCurrentTime.Text = currentTime.ToLongTimeString();
        }
    }
}