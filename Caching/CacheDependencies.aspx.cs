using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Caching;
using System.Xml;
using System.IO;

namespace BeginningASP.NET4._5.Caching
{
    public partial class CacheDependencies : System.Web.UI.Page
    {
        CacheDependency prodListDependency;
        XmlDocument productList;

        protected void Page_Load(object sender, EventArgs e)
        {
            //create a dependency for the ProductList.xml file
            prodListDependency = new CacheDependency(Server.MapPath("ProductList.xml"));
            productList = new XmlDocument();
            productList.Load(Server.MapPath("ProductList.xml"));

            xmlOut.Text = "";
            lblResult.Text = "";
        }

        protected void cmdAddToCache_Click(object sender, EventArgs e)
        {
            //add a cache item that is dependent on the ProductList.xml file
            Cache.Insert("ProductList", productList, prodListDependency);
            lblResult.Text += "<br />\"ProductList\" has been added to Cache";
        }

        protected void cmdQueryCache_Click(object sender, EventArgs e)
        {
            if (Cache["ProductList"] == null)
            {
                lblResult.Text += "<br />Cached item no longer exists";
            }
            else
            {
                XmlDocument cachedItem = (XmlDocument)Cache["ProductList"];
                lblResult.Text += "<br />Retrieved \"ProductList\" from cache";
                string theXml = Server.HtmlEncode(File.ReadAllText(Server.MapPath("ProductList.xml")));
                xmlOut.Text = theXml;

            }
        }

        protected void cmdAlterXMLFile_Click(object sender, EventArgs e)
        {
            XmlDocument xmlFile = new XmlDocument();
            xmlFile.Load(Server.MapPath("ProductList.xml"));

            XmlNode node;
            node = xmlFile.DocumentElement;

            foreach (XmlNode node1 in node.ChildNodes)
            {
                foreach (XmlNode node2 in node1.ChildNodes)
                {
                    if (node2.Name.ToUpper() == "COST")
                    {
                        try 
	                    {
                            decimal oldPrice = decimal.Parse(node2.InnerText);
                            decimal newPrice = oldPrice + 1.99M;
                            node2.InnerText = newPrice.ToString();
	                    }
	                    catch (Exception ex)
	                    {
                            System.Diagnostics.Debug.Print("There's been an EXCEPTION!!!" + ex.Message);
	                    }
                        
                    }
                }
            }

            xmlFile.Save(Server.MapPath("ProductList.xml"));
            lblResult.Text = "<br />XML file has been altered.<br />Because the XML file has been altered, the Cache[\"ProductList\"] item has been removed from cache.";
        }
    }
}