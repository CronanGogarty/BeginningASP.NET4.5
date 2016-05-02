using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.DataBinding
{
    public partial class Gridview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void DeetailsViewProducts_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {

        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows == 0)
            {
                lblMessage.Text = "Update was not processed.";
            }
            else
            {
                lblMessage.Text = "Record was successfully updated";
            }
        }
    }
}