using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.Caching
{
    public partial class SimpleDataCache : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                lblInfo.Text += "Page was posted back";
            }
            else
            {
                lblInfo.Text += "Page was created";
            }

            if (Cache["CacheItem"] == null)
            {
                lblInfo.Text += "<br />Creating cache item...";
                DateTime cacheItemCreated = DateTime.Now;

                lblInfo.Text += "<br />Storing CacheItem in Cache for 30 seconds...";
                lblInfo.Text += "<br />cacheItemCreated value = " + cacheItemCreated.ToString();

                Cache.Insert("CacheItem", cacheItemCreated, null, DateTime.Now.AddSeconds(30), TimeSpan.Zero);
            }
            else
            {
                lblInfo.Text += "<br />Retrieving cached item...";
                DateTime cacheItemCreated = (DateTime)Cache["CacheItem"];
                lblInfo.Text += "<br />CacheItem is..." + cacheItemCreated.ToString();
            }

            lblInfo.Text += "<br /><br />";
        }

        protected void cmdPost_Click(object sender, EventArgs e)
        {

        }
    }
}