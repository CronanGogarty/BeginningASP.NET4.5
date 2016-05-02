using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BeginningASP.NET4._5.DataBinding
{
    public partial class ADO_NETDataBinding : System.Web.UI.Page
    {
        

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataSet ds = new DataSet();
                ds.Tables.Add("Users");
                ds.Tables["Users"].Columns.Add("Name");
                ds.Tables["Users"].Columns.Add("Nationality");

                DataRow row = ds.Tables["Users"].NewRow();
                row["Name"] = "John Bull";
                row["Nationality"] = "England";

                ds.Tables["Users"].Rows.Add(row);

                row = ds.Tables["Users"].NewRow();
                row["Name"] = "Taffy O'Jones";
                row["Nationality"] = "Wales";

                ds.Tables["Users"].Rows.Add(row);

                row = ds.Tables["Users"].NewRow();
                row["Name"] = "Hamish McAngus-McLeod";
                row["Nationality"] = "Scotland";

                ds.Tables["Users"].Rows.Add(row);

                row = ds.Tables["Users"].NewRow();
                row["Name"] = "Pat O'Potatoes";
                row["Nationality"] = "Ireland";

                ds.Tables["Users"].Rows.Add(row);

                lstBxDatabind.DataSource = ds.Tables["Users"];
                lstBxDatabind.DataTextField = "Name";
                lstBxDatabind.DataBind();
            }
        }
    }
}