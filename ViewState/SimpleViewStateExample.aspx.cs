using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.ViewState
{
    public partial class SimpleViewStateExample : System.Web.UI.Page
    {
        //private strings 
        private string copy, errorMessage;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Trace.IsEnabled = true;

            if (this.IsPostBack)
            {
                copy = (string)ViewState["StoredCopy"];
            }
        }

        //PreRender occurs just after page processing is complete and just before the page is rendered in HTML
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (copy != null) {
                ViewState["StoredCopy"] = copy;
            }
        }

        //grab copy from the input and store in a string variable
        protected void cmdStoreCopy_Click(object sender, EventArgs e)
        {
            if (txtCopyToStore.Text.ToString().Length > 0)
            {
                try
                {
                    copy = txtCopyToStore.Text.ToString();
                    txtCopyToStore.Text = "";

                }
                catch (NullReferenceException ex)
                {
                    errorMessage = ex.Message;
                }
            }
        }

        //retrieve copy from the string variable
        //the string variable is populated from ViewState at Page_Load
        protected void cmdLoadStoredCopy_Click(object sender, EventArgs e)
        {
            if ((copy != null) && (copy.Length > 0))
            {
                txtCopyToStore.Text = copy;
            }
        }

        //demonstrate the most basic use of ViewState by creating a ViewState collection item
        //increment the value of the item at each click
        protected void cmdIncreaseStateCounter_Click(object sender, EventArgs e)
        {
            //the counter variable is not really required here, 
            //the value could simply be assigned directly to the ViewState["Counter"]
            int counter = ViewState["Counter"] == null ? 1 : (int)ViewState["Counter"] + 1;
            ViewState["Counter"] = counter;

            lblStateCounter.Text = "ViewState[\"Counter\"] = " + ViewState["Counter"].ToString();
        }
    }
}