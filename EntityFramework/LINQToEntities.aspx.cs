using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BeginningASP.NET4._5.EntityFramework
{
    public partial class LINQToEntities : System.Web.UI.Page
    {
        NorthwindEntities1 entities;

        protected void Page_Load(object sender, EventArgs e)
        {
            entities = new NorthwindEntities1();

            if (!Page.IsPostBack)
            {
                try
                {
                    GetOrdersByID("VAFFE");
                    GetCategories();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.Print(ex.Message);
                    lblErrorMessage.Text = ex.Message;
                }
            }
        }

        private void GetOrdersByID(string id)
        {
            gridView1.DataSource = from orders in entities.Orders.ToList()
                                   where orders.CustomerID == id
                                   select orders;

            gridView1.DataBind();
        }

        private void GetCategories()
        {
            ddlSelectCategory.DataTextField = "CategoryName";
            ddlSelectCategory.DataValueField = "CategoryID";
            ddlSelectCategory.DataSource = entities.Categories.ToList();
            ddlSelectCategory.DataBind();
        }

        protected void ddlSelectCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = Int32.Parse(ddlSelectCategory.SelectedValue);
            if (selectedIndex > -1)
            {
                try
                {
                    PopulateCategoryProducts(selectedIndex);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.Print(ex.Message);
                    lblErrorMessage.Text = ex.Message;
                }
            }
        }

        private void PopulateCategoryProducts(int id)
        {
            gridViewCategoryProducts.DataSource = from product in entities.Products.ToList()
                                                  where product.CategoryID == id
                                                  select new
                                                      {
                                                          ID = product.ProductID,
                                                          Name = product.ProductName,
                                                          UnitPrice = product.UnitPrice,
                                                          InStock = product.UnitsInStock
                                                      };

            gridViewCategoryProducts.DataBind();
        }

        protected void cmdHideGrid_Click(object sender, EventArgs e)
        {
            gridView1.Visible = false;
        }
    }
}