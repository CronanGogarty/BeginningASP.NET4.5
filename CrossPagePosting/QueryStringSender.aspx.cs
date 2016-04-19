using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.CrossPagePosting
{
    public partial class QueryStringSender : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lstProducts.Items.Add("Flatscreen TV");
                lstProducts.Items.Add("Xbox 360");
                lstProducts.Items.Add("K2 Raygun Snowboard");
                lstProducts.Items.Add("HTC One S");
            }
        }

        protected void cmdSendQuery_Click(object sender, EventArgs e)
        {
            string queryString;
            queryString = "QueryStringReceiver.aspx?";
            queryString += "Product=" + Server.UrlEncode(lstProducts.SelectedItem.Text);
            queryString += "&ShowDetails=" + Server.UrlEncode(chkShowDetails.Checked.ToString());

            Response.Redirect(queryString);
        }
    }
}