using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.Controls
{
    public partial class Footer : System.Web.UI.UserControl
    {
        //create an enumeration to hold the FooterFormat options
        public enum FooterFormat
        {
            LongDate,
            ShortTime
        }

        //declare a private variable of type FooterFormat 
        //initaite the variable with a value from the FooterFormat enumeration
        private FooterFormat format = FooterFormat.LongDate;

        //declare a property proceure to allow access to the private member
        public FooterFormat Format
        {
            get { return format; }
            set { format = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string strOutput;
            strOutput = "This page was served to you at:";

            if (format == FooterFormat.LongDate)
            {
                strOutput += "<br />" + DateTime.Now.ToLongDateString();
            }
            else
            {
                strOutput += "<br />" + DateTime.Now.ToShortTimeString();
            }

            lblFooterText.Text = strOutput;
        }
    }
}