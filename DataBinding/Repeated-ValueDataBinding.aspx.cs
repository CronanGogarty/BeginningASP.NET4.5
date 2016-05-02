using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.DataBinding
{
    public partial class Repeated_ValueDataBinding : System.Web.UI.Page
    {
        private string errorMessage, result;
        bool errorRaised;

        protected void Page_Load(object sender, EventArgs e)
        {
            //create a strongly typed List collection
            List<string> fruit = new List<string>();
            fruit.Add("Apple");
            fruit.Add("Banana");
            fruit.Add("Cantaloupe");
            fruit.Add("Grapefruit");
            fruit.Add("Jackfruit");
            fruit.Add("Mango");
            fruit.Add("Nectarine");
            fruit.Add("Orange");
            fruit.Add("Pineapple");
            fruit.Add("Kiwi");

            selFruit.DataSource = fruit;
            lstFruit.DataSource = fruit;
            this.rdoLst.DataSource = fruit;
            this.bulLst.DataSource = fruit;
            chkLst.DataSource = fruit;


            try
            {
                this.DataBind();
            }
            catch (InvalidOperationException ex)
            {
                printException(ex);
            }
            catch (Exception ex)
            {
                printException(ex);
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (errorRaised)
            {
                lblRptVakErrormessage.Text = errorMessage;

            }
        }

        private void printException(Exception ex)
        {
            System.Diagnostics.Debug.Print("*********************************EXCEPTION*************************");
            System.Diagnostics.Debug.Print(ex.Message);
            errorMessage = ex.Message;
            errorRaised = true;
        }
    }
}