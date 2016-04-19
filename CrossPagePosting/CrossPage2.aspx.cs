using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.CrossPagePosting
{
    public partial class CrossPage2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrossPage1 prevPage = PreviousPage as CrossPage1;
            if (prevPage != null)
            {
                string prevFirstName, prevLastName;
                int prevAge;

                //this is the code that accesses the public properties we created on CrossPage1
                prevFirstName = prevPage.FirstName;
                prevLastName = prevPage.LastName;
                prevAge = prevPage.Age;

                lblPreviousPage.Text = "You came from the following Page: " + this.PreviousPage.Title;
                lblFirstName.Text = "You entered the following FirstName: " + prevFirstName;
                lblLastName.Text = "You entered the following LastName: " + prevLastName;
                lblAge.Text = "You entered the following Age: " + prevAge.ToString();
            }
        }
    }
}