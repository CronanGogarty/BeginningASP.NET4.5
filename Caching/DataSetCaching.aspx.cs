using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace BeginningASP.NET4._5.Caching
{
    public partial class DataSetCaching : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    DataSet ds = GetDataSet();
                    chkColumns.DataSource = ds.Tables["Customers"].Columns;
                    chkColumns.DataTextField = "ColumnName";
                    chkColumns.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.Print(ex.Message);
                }
                
            }
        }

        private DataSet RetrieveData()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Northwind"].ConnectionString;
            string SQLCommand = "SELECT TOP 10 * FROM Customers";
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(SQLCommand, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            try
            {
                conn.Open();
                adapter.Fill(ds, "Customers");
            }
            catch (SqlException ex)
            {
                System.Diagnostics.Debug.Print(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        private DataSet GetDataSet()
        {
            DataSet ds = (DataSet)Cache["Customers"];

            if (ds==null)
            {
                ds = RetrieveData();
                Cache.Insert("Customers", ds, null, DateTime.MaxValue, TimeSpan.FromMinutes(2));
                lblCacheStatus.Text = "Added \"Customers\" DataSet to Cache.";


            }
            else
            {
                lblCacheStatus.Text = "Retrieved \"Customers\" DataSet from Cache.";
            }

            return ds;
        }

        protected void cmdFilter_Click(object sender, EventArgs e)
        {
            DataSet ds = GetDataSet();

            ds = ds.Copy();  //copy the dataset so you can remove columns without affecting the cached item

            foreach (ListItem item in chkColumns.Items)
            {
                if (item.Selected)
                {
                    ds.Tables[0].Columns.Remove(item.Text);
                }
            }

            gridCustomers.DataSource = ds.Tables[0];
            gridCustomers.DataBind();
        }
    }
}