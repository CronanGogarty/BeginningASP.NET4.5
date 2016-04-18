using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace BeginningASP.NET4._5.ExceptionHandling
{
    public partial class DivideAbyB : System.Web.UI.Page
    {
        decimal a, b, result;
        bool FlagError = false;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //use the Page_PreRender event to evaluate variables that have been set in the Page_Load and <Control>_<Event> events
        //Page_PreRender event occurs prior to the HTML being generated, it is a good time to set HTML styles
        //in the example below, I use a boolean value to determine the color of the results label;
        //this is more efficient (in coding terms) than setting the styles in each catch block
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (FlagError == true) {
                lblResult.ForeColor = Color.Red;
                lblResult.BorderColor = Color.Red;
            }
            else
            {
                lblResult.ForeColor = Color.Black;
                lblResult.BorderColor = Color.Black;
            }
        }

        protected void cmdDivideAbyB_Click(object sender, EventArgs e)
        {
            
            try
            {
                a = decimal.Parse(txtInputA.Text); 
                b = decimal.Parse(txtInputB.Text);

                divideNumbers(a, b);
            }
            catch (Exception ex)
            {

                lblResult.Text = "There was an error trying to read the values you entered - please enter numeric values only: " + ex.Message;
                FlagError = true;
            }


        }

        private void divideNumbers(decimal a, decimal b)
        {
            try
            {
                result = a / b;
                lblResult.Text = result.ToString();

            }
            catch (DivideByZeroException ex)
            {
                lblResult.Text = "You tried to divide by zero: " + ex.Message;
                FlagError = true;
            }
            //"catching System.Exception is nearly always the wrong thing to do as well." - Brent Rector
            //https://blogs.msdn.microsoft.com/kcwalina/2006/07/05/choosing-the-right-type-of-exception-to-throw/
            catch (Exception ex)
            {
                lblResult.Text = "A generic exception occurred: " + ex.Message;
                FlagError = true;
            }
        }
    }
}