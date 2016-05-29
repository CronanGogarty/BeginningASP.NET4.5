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
                lblInfo.Text += "This is a postback";
            }
            else
            {
                lblInfo.Text += "The page has been newly created - this is not a postback";
            }

            if (Cache["CacheItem"] == null)
            {
                lblInfo.Text += "<br />Creating CacheItem at DateTime: " + DateTime.Now.ToString();
                DateTime cacheItemCreated = DateTime.Now;

                lblInfo.Text += "<br />The CacheItem has now been stored in Cache and will be cached for for 30 seconds.<br />If you refresh the page you will see the value of CacheItem will not change for the next 30 seconds.<br />When 30 seconds have elapsed, a new CacheItem will be created and stored in cache.";
                lblInfo.Text += "<br />CacheItem value = " + cacheItemCreated.ToString();

                Cache.Insert("CacheItem", cacheItemCreated, null, DateTime.Now.AddSeconds(30), TimeSpan.Zero);
            }
            else
            {
                lblInfo.Text += "<br />Retrieving CacheItem from cache.";
                DateTime cacheItemCreated = (DateTime)Cache["CacheItem"];
                lblInfo.Text += "<br />The value stored in CacheItem = " + cacheItemCreated.ToString();
            }

            lblInfo.Text += "<br /><br />";
        }

        protected void cmdPost_Click(object sender, EventArgs e)
        {

        }
    }
}