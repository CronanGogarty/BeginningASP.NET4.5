using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.ExceptionHandling
{
    public partial class CustomExceptionHandlers : System.Web.UI.Page
    {
        //declare the variables to be used
        private decimal a, b, result;
        private string errorMessage;
        private bool errorFlag = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            Trace.IsEnabled = true;

            if (!Page.IsPostBack)
            {
                lblResult.Visible = false;
            }
            else
            {
                lblResult.Visible = true;
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (errorFlag == true)
            {
                lblResult.ForeColor = Color.Red;
                lblResult.BorderColor = Color.Red;
                lblResult.Text = errorMessage;
            }
            else
            {
                lblResult.ForeColor = Color.Black;
                lblResult.BorderColor = Color.Black;
                lblResult.Text = result.ToString();
            }
        }

        protected void cmdDivideAbyB_Click(object sender, EventArgs e)
        {
            //add a message to the trace information
            Trace.Warn("cmdDivideAbyB_Click", "About to place an item in session state.");
            Session["Test"] = "Contents";
            Trace.Warn("cmdDivideAbyB_Click", "Placed item in session state.");

            try
            {
                //try to populate the variables from the user input
                a = decimal.Parse(txtInputA.Text);
                b = decimal.Parse(txtInputB.Text);

                try
                {
                    //if the user input is ok and the variables are populated, try to run division method
                    divideAbyB(a, b);
                }
                catch (CustomDivideByZeroException err)
                {
                    //
                    err.Number = a;
                    errorMessage = buildErrorMessage(err);
                    errorMessage += "<br />Number to be divided: " + err.Number;
                    errorFlag = true;
                    Trace.Warn("cmdDivideAbyB_Click", "Caught CustomDivideByZeroException exception", err);
                }
                
            }
            catch (ArgumentNullException ex)
            {
                //this exception will never be caught since decimal is a non-nullable type
                errorMessage = buildErrorMessage(ex);
                errorFlag = true;
            }
            catch (FormatException ex)
            {
                //this exception will occur if the user has entered text or other input that cannot be parsed to a decimal
                errorMessage = buildErrorMessage(ex);
                errorFlag = true;
            }
        }

        private decimal divideAbyB(decimal a, decimal b)
        {
            try
            {
                //attempt to divide a by b
                result = a / b;
            }
            catch (DivideByZeroException err)
            {
                //if b is 0 then this code will run
                //at this point we create a CustomDivideByZeroException object and throw it back to the calling try/catch block
                CustomDivideByZeroException ex = new CustomDivideByZeroException("You tried to divide by zero - this is not valid", err);
                throw ex;
            }

            //if the division was successful, return the result to the calling code
            return result;
        }

        private string buildErrorMessage(Exception ex)
        {
            //use this method to construct a generic error message
            //add custom properties to the string within the specific exception handling code
            errorMessage = ex.GetType() + " exception occurred!<br />Message: " + ex.Message;
            errorMessage += "<br />Data: " + ex.Data;
            errorMessage += "<br />HelpLink: " + ex.HelpLink;
            errorMessage += "<br />HResult: " + ex.HResult;
            errorMessage += "<br />InnerException: " + ex.InnerException;
            errorMessage += "<br />Source: " + ex.Source;
            errorMessage += "<br />StackTrace: " + ex.StackTrace;
            errorMessage += "<br />TargetSite: " + ex.TargetSite;

            return errorMessage;
        }
    }
}