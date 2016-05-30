using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;   

namespace BeginningASP.NET4._5.CrossPagePosting
{
    public partial class QueryStringReceiver : System.Web.UI.Page
    {
        string product;
        string showDetails;

        protected void Page_Load(object sender, EventArgs e)
        {
            //no need to use URLDecode
            //ASP.NET automatically decodes your values when you access them 
            //through the Request.QueryString collection.
            product = Request.QueryString["Product"];
            showDetails = Request.QueryString["ShowDetails"];

            lblProduct.Text = "Selected Product = " + product;
            lblShowDetails.Text = "ShowDetails = " + showDetails;

            lblRetrievedCookie.Text = "";
        }

        protected void cmdSetCookie_Click(object sender, EventArgs e)
        {
            HttpCookie productCookie = new HttpCookie("ProductCookie");
            productCookie.Value = product;

            Response.Cookies.Add(productCookie);

            lblRetrievedCookie.Text = "Added " + product + " to cookie";
        }

        protected void cmdRetrieveCookie_Click(object sender, EventArgs e)
        {
            HttpCookie retreivedCookie = Request.Cookies["ProductCookie"];
            if (retreivedCookie != null)
            {
                lblRetrievedCookie.Text = "ProductCookie = " + retreivedCookie.Value.ToString();
            }
            else
            {
                lblRetrievedCookie.Text = "That cookie does not exist";
            }
        }

        protected void cmdRemoveCookie_Click(object sender, EventArgs e)
        {
            //to remove a cookie, simply set the expiry date in the past and add the cookie to the cookies collection
            if (Request.Cookies["ProductCookie"] != null)
            {
                HttpCookie cookieToRemove = Request.Cookies["ProductCookie"];
                cookieToRemove.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookieToRemove);
            }
            else
            {
                lblRetrievedCookie.Text = "No cookie to delete";
            }
            
        }
    }
}