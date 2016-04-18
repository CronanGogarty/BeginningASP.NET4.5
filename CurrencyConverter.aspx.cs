using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5
{
    public partial class CurrencyConverter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                selCurrency.Items.Add(new ListItem("EUR","0.85"));
                selCurrency.Items.Add(new ListItem("GBP", "0.65"));
                selCurrency.Items.Add(new ListItem("CAD", "1.15"));

            }
        }

        protected void convertButton_ServerClick(object sender, EventArgs e)
        {
            decimal USamount;

            bool success = Decimal.TryParse(txtUSDollars.Value, out USamount);

            if (success)
            {
                ListItem selectedItem = selCurrency.Items[selCurrency.SelectedIndex];

                decimal convertedValue = (USamount * Decimal.Parse(selectedItem.Value));
                conversionResult.InnerText = "USD $" + USamount + " converted to "+ selectedItem.Text + " = " + convertedValue;
            }
            else
            {
                conversionResult.InnerText = "Failed to parse()";
            }
        }
    }
}