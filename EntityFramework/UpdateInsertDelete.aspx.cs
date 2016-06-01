using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BeginningASP.NET4._5.EntityFramework
{
    public partial class UpdateInsertDelete : System.Web.UI.Page
    {
        NorthwindEntities1 entities;
        private string result, errorMessage = "";
        bool errorRaised = false;
        private int highestIDValue;

        protected void Page_Load(object sender, EventArgs e)
        {
            entities = new NorthwindEntities1();

            if (!Page.IsPostBack)
            {
                try
                {
                    PopulateGridViewProducts();
                }
                catch (SqlException ex)
                {
                    printExceptions(ex);
                }
                catch (Exception ex)
                {
                    printExceptions(ex);
                }
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            
            if (errorRaised)
            {
                lblErrorMessage.Text = errorMessage;
            }
            if (result != "")
            {
                lblResult.Text = result;
            }
        }

        private void PopulateGridViewProducts()
        {
            gridViewProducts.DataSource = from product in entities.Products.ToList()
                                          //where product.ProductID <= 20
                                          select new
                                          {
                                              ProductID = product.ProductID,
                                              ProductName = product.ProductName,
                                              UnitsInStock = product.UnitsInStock,
                                              UnitPrice = product.UnitPrice
                                          };
            
            gridViewProducts.DataBind();

            //highestIDValue = entities.Products.Count();
            highestIDValue = entities.Products.Max(p => p.ProductID);

            lblHighestID.Text = "Highest current ID = " + highestIDValue.ToString();

        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            if (gridViewProducts.SelectedIndex != -1)
            {
                try
                {
                    UpdateSelectedProduct(gridViewProducts.SelectedIndex);
                }
                catch (SqlException ex)
                {
                    printExceptions(ex);
                }
                catch (Exception ex)
                {
                    printExceptions(ex);
                }
            }
            else
            {
                result = "You must select a product to update";
            }
        }

        private void UpdateSelectedProduct(int selectedIndex)
        {
            try
            {
                //use LINQ expression to find the selected product
                int selectedProductID = Int32.Parse(gridViewProducts.SelectedDataKey.Value.ToString());
                var match = from selectedProduct in entities.Products.ToList()
                            where selectedProduct.ProductID == selectedProductID
                            select selectedProduct;
                //execute the query and return a product
                Product product = match.Single();

                //change the entity object
                //apply a discount of 25%
                decimal newPrice = (decimal)(product.UnitPrice * 0.75M);
                product.UnitPrice = newPrice;

                //Commit the chanes back to the database
                entities.SaveChanges();

                result = string.Format("{0} has been updated to {1:C}", product.ProductName, newPrice);

                PopulateGridViewProducts();
                gridViewProducts.SelectedIndex = selectedIndex;
            }
            catch (SqlException ex)
            {
                printExceptions(ex);
            }
            catch (Exception ex)
            {
                printExceptions(ex);
            }
        }

        protected void cmdInsert_Click(object sender, EventArgs e)
        {
            

            try
            {
                highestIDValue = entities.Products.Max(p => p.ProductID);

                Product newProduct = new Product();
                newProduct.ProductID = highestIDValue++;
                newProduct.ProductName = "My New Product";
                newProduct.SupplierID = 1;
                newProduct.CategoryID = 2;
                newProduct.QuantityPerUnit = "1";
                newProduct.UnitPrice = 19.99M;
                newProduct.UnitsInStock = 36;
                newProduct.UnitsOnOrder = 0;
                newProduct.Discontinued = false;

                entities.Products.Add(newProduct);
                entities.SaveChanges();

                PopulateGridViewProducts();

                result = String.Format("The following product {0}, with an ID of {1}, has been added to the database.", newProduct.ProductName, newProduct.ProductID);

            }
            catch (SqlException ex)
            {
                printExceptions(ex);
            }
            catch (Exception ex)
            {
                printExceptions(ex);
            }
        }

        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            if (gridViewProducts.SelectedIndex != -1)
            {
                try
                {
                    //find the selected product
                    int selectedProductID = (int)gridViewProducts.SelectedDataKey.Value;
                    var match = from product in entities.Products.ToList()
                                where product.ProductID == selectedProductID
                                select product;
                    Product selectedProduct = match.Single();

                    //delete the record from the database
                    entities.Products.Remove(selectedProduct);
                    entities.SaveChanges();

                    PopulateGridViewProducts();
                    gridViewProducts.SelectedIndex = -1;

                    result = string.Format("The following product \"{0}\" with ID = {1} was deleted from the database.", selectedProduct.ProductName, selectedProduct.ProductID);

                }
                catch (SqlException ex)
                {
                    printExceptions(ex);
                }
                catch (Exception ex)
                {

                    printExceptions(ex);
                }
            }
            else
            {
                result = "Please select a product to delete";
            }
        }

        private void printExceptions(Exception ex)
        {
            System.Diagnostics.Debug.Print("*************************EXCEPTION************************");
            System.Diagnostics.Debug.Print(ex.Message);
    
            errorMessage = ex.Message;
            errorRaised = true;
        }

        //all this code is simply to format the UnitPrice field into currency format
        protected void gridViewProducts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal currentDecimal = decimal.Parse(e.Row.Cells[4].Text);
                e.Row.Cells[4].Text = string.Format("{0:C}", currentDecimal);
            }
        }
    }
}