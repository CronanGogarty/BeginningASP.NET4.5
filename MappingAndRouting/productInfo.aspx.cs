using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5
{
    public partial class productInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string result = "";

            if (!Page.IsPostBack)
            {
                try
                {
                    result = "You entered the following productID: " + (string)Page.RouteData.Values["productID"];
                }
                catch (NullReferenceException ex)
                {
                    System.Diagnostics.Debug.Print("*****************EXCEPTION*****************");
                    System.Diagnostics.Debug.Print(ex.Message);
                    result = ex.Message;
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.Print("*****************EXCEPTION*****************");
                    System.Diagnostics.Debug.Print(ex.Message);
                    result = ex.Message;
                }

                lblProductID.Text = result;
            }
        }
    }
}