using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.ViewState
{
    public partial class StoreObjectInViewState : System.Web.UI.Page
    {
        string first, last, output;
        int age;
        bool flagError = false;
        SerializablePerson person, retrievedPerson;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                for (int i = 18; i < 100; i++)
                {
                    selAge.Items.Add(i.ToString());
                }
                lblResult.Visible = false;
            }
            else
            {
                lblResult.Visible = true;
            }

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            lblResult.Text = output;

            if (flagError == true)
            {
                lblResult.ForeColor = Color.Red;
                lblResult.BorderColor = Color.Red;
            }
        }

        protected void cmdCreatePerson_Click(object sender, EventArgs e)
        {
            if ((txtFirstName.Text.Length > 0) && (txtLastName.Text.Length > 0))
            {
                try
                {
                    first = txtFirstName.Text.ToString();
                    last = txtLastName.Text.ToString();
                    age = Int32.Parse(selAge.SelectedItem.Text);

                    txtFirstName.Text = "";
                    txtLastName.Text = "";
                    selAge.SelectedIndex = 0;

                    person = new SerializablePerson(first, last, age);
                    ViewState["CurrentPerson"] = person;

                    output = "You have successfully created a SerializablePerson object with the following properties:";
                    output += "<br />FirstName: " + person.Firstname;
                    output += "<br />LastName: " + person.LastName;
                    output += "<br />Age: " + person.Age;
                    

                }
                catch (NullReferenceException ex)
                {
                    output = ex.ToString();
                    flagError = true;
                    Console.WriteLine(ex.ToString());
                }
                catch (InvalidCastException ex)
                {
                    output = ex.ToString();
                    flagError = true;
                    Console.WriteLine(ex.ToString());
                }
            }
        }

        protected void cmdRetrievePerson_Click(object sender, EventArgs e)
        {
            if (ViewState["CurrentPerson"] != null)
            {
                //Console.WriteLine(ViewState["CurrentPerson"].ToString());
                output = "The following person object is stored  in ViewState:";
                retrievedPerson = (SerializablePerson)ViewState["CurrentPerson"];
                output += "<br />FirstName: " + retrievedPerson.Firstname;
                output += "<br />LastName: " + retrievedPerson.LastName;
                output += "<br />Age: " + retrievedPerson.Age;
            }
        }
    }
}