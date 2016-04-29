using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5
{
    public partial class BasicTemplate : System.Web.UI.MasterPage
    {
        string h1Text, prevSiblingURL, nextSiblingURL = "";
        bool next, prev;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                h1Text = SiteMap.CurrentNode.Title.ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.Print("*************************EXCEPTION***********************");
                System.Diagnostics.Debug.Print(ex.Message);
            }

            //determine if there are sibling nodes in the site map
            try
            {
                if (SiteMap.CurrentNode.PreviousSibling != null)
                {
                    prevSiblingURL = SiteMap.CurrentNode.PreviousSibling.Url;
                    prev = true;
                }
                if (SiteMap.CurrentNode.NextSibling != null)
                {
                    nextSiblingURL = SiteMap.CurrentNode.NextSibling.Url;
                    next = true;
                }
            }
            catch (NullReferenceException ex)
            {
                System.Diagnostics.Debug.Print("************************EXCEPTION***********************");
                System.Diagnostics.Debug.Print(ex.Message);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.Print("************************EXCEPTION***********************");
                System.Diagnostics.Debug.Print(ex.Message);
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if ((h1Text != null) && (h1Text != ""))
            {
                lblH1.Text = h1Text;
            }
            else
            {
                lblH1.Text = "Beginning ASP.NET 4.5";
            }
            if (prev == true)
            {
                try
                {
                    lnkPrevSibling.Visible = true;
                    lnkPrevSibling.NavigateUrl = prevSiblingURL;
                    int x = prevSiblingURL.LastIndexOf('/') + 1;
                    lnkPrevSibling.Text = "<<< " + prevSiblingURL.Substring(x);
                }
                catch (NullReferenceException ex)
                {
                    System.Diagnostics.Debug.Print(ex.Message);
                }
            }
            if (next)
            {
                try
                {
                    lnkNextSibling.Visible = true;
                    lnkNextSibling.NavigateUrl = nextSiblingURL;
                    int x = nextSiblingURL.LastIndexOf('/') + 1;
                    lnkNextSibling.Text = nextSiblingURL.Substring(x) + " >>>";
                }
                catch (NullReferenceException ex)
                {
                    System.Diagnostics.Debug.Print(ex.Message);
                }

            }
        }
    }
}