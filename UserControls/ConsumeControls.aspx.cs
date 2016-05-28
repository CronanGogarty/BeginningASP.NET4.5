using BeginningASP.NET4._5.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.UserControls
{
    public partial class ConsumeControls : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //determine which format to display the footer date in
            if (rdoLongDate.Checked == true)
            {
                ascxFooter.Format = Footer.FooterFormat.LongDate;
            }
            else
            {
                ascxFooter.Format = Footer.FooterFormat.ShortTime;
            }
        }

        //ensure that we are passing our custom LinkClickedEventArgs object instead of the generic EventArgs object
        protected void LinkClicked(object sender, LinkClickedEventArgs e)
        {
            lblClick.Text = "Click detected = " + e.Url;
        }
    }
}