using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.MappingAndRouting
{
    public partial class ThisURLIsMapped : System.Web.UI.Page
    {
        private string result = "no result";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                result = Request.QueryString["Product"];
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }
            //lnkPage.NavigateUrl = Page.GetRouteUrl("URLRoute1", new { productId = "product123" });
            //lnkPage.Text = "Follow this link...";
            lblProduct.Text = result;
        }
    }
}