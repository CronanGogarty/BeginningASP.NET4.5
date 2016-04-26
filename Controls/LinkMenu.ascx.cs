using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BeginningASP.NET4._5;

namespace BeginningASP.NET4._5.Controls
{
    public partial class LinkMenu : System.Web.UI.UserControl
    {
        //create an event type for links clicked on the LinkMenu user control
        //using generics, we can specify the LinkClicked event will use the LinkClickEventArgs object
        public event EventHandler<LinkClickedEventArgs> LinkClicked;

        //make sure the CommandEventArgs object is sent as the args parameter
        //this give access to values specified in the CommandArgument property of the links in LinkMenu.ascx
        protected void link_Click(object sender, CommandEventArgs e)
        {
            //test to ensure the LinkClicked event isn't null
            if (LinkClicked != null)
            {
                //create a new LinkClickedEventArgs object - this will set the Url property of the object
                //to the value contained in the CommandArgument property of the link 
                LinkClickedEventArgs args = new LinkClickedEventArgs((string)e.CommandArgument);
                LinkClicked(this, args);

            }
        }
    }
}