using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.SessionState
{
    public partial class CreateProduct : System.Web.UI.Page
    {
        //define page variables
        string name, description, errorOutput, output;
        int id, productCounter = 0;
        decimal price;
        bool errorFlag, successFlag;
        Product product;

        protected void Page_Load(object sender, EventArgs e)
        {
            //set initial values of some page variables
            errorFlag = false;
            successFlag = false;
            errorOutput = "";
            lblErrorOutput.Text = "";
            lblOutput.Text = "";

            //use the application collection to store a count of the product objects created by this application
            Application.Lock();
                if (Application["ProductCounter"] != null)
                {
                    productCounter = (int)Application["ProductCounter"];
                }
                Application["ProductCounter"] = productCounter;
            Application.UnLock();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //if an exception has been thrown, display the exception message in red text
            if (errorFlag == true)
            {
                lblErrorOutput.Visible = true;
                lblErrorOutput.Text = errorOutput;
                lblErrorOutput.ForeColor = Color.Red;
            }

            //if the object has been created successfully, display the output in green text
            if (successFlag)
            {
                lblOutput.Visible = true;
                lblOutput.ForeColor = Color.Green;
                lblOutput.Text = output;

                //reset the form fields
                txtName.Text = "";
                txtDescription.Text = "";
                txtID.Text = "";
                txtPrice.Text = "";

                cmdRetreiveProductFromSessionState.Visible = true;
            }

            lblProductCounter.Text = String.Format("The application has created {0} products since it began running", Application["ProductCounter"].ToString());
        }

        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //attempt to read and parse the user input
                name = txtName.Text;
                description = txtDescription.Text;
                id = Int32.Parse(txtID.Text);
                price = decimal.Parse(txtPrice.Text);

                System.Diagnostics.Debug.Print("Successfully read user input");

                try
                {
                    //try to create a product object from the user input
                    product = new Product(name, description, id, price);

                    output = "You have successfully created a new Product object.";
                    output += "<br />Name: " + product.Name;
                    output += "<br />Description: " + product.Description;
                    output += "<br />ID: " + product.ID.ToString();
                    output += "<br />Price: $" + product.Price.ToString();

                    successFlag = true;

                    //increment the productCounter when a new product object is created
                    productCounter++;
                    Application.Lock();
                        Application["ProductCounter"] = productCounter;
                    Application.UnLock();

                    System.Diagnostics.Debug.Print("Successfully created Product object");

                    try
                    {
                        //add the product object to SessionState
                        Session["Product"] = product;
                        lblOutput.Text += "<br />Product was added to SessionState";
                    }
                    catch (Exception ex)
                    {
                        errorOutput = ex.ToString();
                        errorFlag = true;
                        System.Diagnostics.Debug.Print(ex.ToString());
                    }
                }
                catch (InvalidOperationException ex)
                {
                    //catch an error when creating the Product object
                    errorOutput = ex.ToString();
                    errorFlag = true;
                    System.Diagnostics.Debug.Print("InvalidOperationException when attempting to create Product object");
                }
            }
            catch (FormatException ex)
            {
                errorOutput = ex.ToString();
                errorFlag = true;
                System.Diagnostics.Debug.Print(ex.ToString());
            }
            catch (HttpParseException ex)
            {
                errorOutput = ex.ToString();
                errorFlag = true;
                System.Diagnostics.Debug.Print(ex.ToString());
            }
            catch (InvalidCastException ex)
            {
                errorOutput = ex.ToString();
                errorFlag = true;
                System.Diagnostics.Debug.Print(ex.ToString());
            }
        }


        protected void cmdRetreiveProductFromSessionState_Click(object sender, EventArgs e)
        {
            try
            {
                Product newProduct = (Product)Session["Product"];

                if (newProduct != null)
                {
                    output = "You have retrieved the following object from SessionState:";
                    output += "<br />Name: " + newProduct.Name;
                    output += "<br />Description: " + newProduct.Description;
                    output += "<br />ID: " + newProduct.ID;
                    output += "<br />Price: $" + newProduct.Price;

                    successFlag = true;
                }
            }
            catch (Exception ex)
            {
                errorOutput = ex.ToString();
                errorFlag = true;
                System.Diagnostics.Debug.Print(ex.ToString());
            }
        }
    }
}