using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.EntityDataModels
{
    public partial class Relationships : System.Web.UI.Page
    {
        NorthwindEntities1 entities = new NorthwindEntities1();
        StringBuilder sb = new StringBuilder();

        protected void Page_Load(object sender, EventArgs e)
        {
            

            try
            {
                GetCustomerOrders();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.Print(ex.Message);
                lblErrorMessage.Text = ex.Message;
            }
        }

        private void GetCustomerOrders()
        {
            foreach (Customer customer in entities.Customers)
            {
                sb.Append("<strong>");
                sb.Append(customer.ContactName);
                sb.Append("</strong><br />");

                //list this customer's orders
                foreach (Order custOrder in customer.Orders)
                {

                    sb.Append(custOrder.OrderID.ToString());
                    sb.Append(" - placed on date - ");
                    sb.Append(custOrder.OrderDate.Value.ToShortDateString());
                    sb.Append("<br />");
                }

                sb.Append("<hr /><br />");

                lblOutput.Text = sb.ToString();
            }
        }
    }
}