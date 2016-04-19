using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.CrossPagePosting
{
    public partial class CrossPage1 : System.Web.UI.Page
    {
        //in order to expose the values entered in CrossPage1 when submitted to CrossPage2
        //it is necessary to create public properties that CrossPage2 can access
        public string FirstName
        {
            get
            {
                return txtFirstName.Text;
            }
        }
        public string LastName
        {
            get
            {
                return txtLastName.Text;
            }
        }
        public int Age
        {
            get
            {
                return Int32.Parse(selAge.SelectedItem.Text);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                for (int i = 18; i < 100; i++)
                {
                    selAge.Items.Add(i.ToString());
                }
            }
        }
    }
}