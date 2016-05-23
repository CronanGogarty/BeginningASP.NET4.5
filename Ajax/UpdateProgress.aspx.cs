using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.Ajax
{
    public partial class UpdateProgress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblCurrentTime.Text = DateTime.Now.ToLongTimeString();
            }
        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(TimeSpan.FromSeconds(10));
            lblCurrentTime.Text = DateTime.Now.ToLongTimeString();
        }
    }
}