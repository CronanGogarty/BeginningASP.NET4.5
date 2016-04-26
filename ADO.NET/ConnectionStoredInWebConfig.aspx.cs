using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace BeginningASP.NET4._5.ADO.NET
{
    public partial class ConnectionStoredInWebConfig : System.Web.UI.Page
    {
        private string result = "";
        private static string connectionString = WebConfigurationManager.ConnectionStrings["Pubs"].ConnectionString;
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection myConnection = new SqlConnection(connectionString);
                SqlCommand myCommand = new SqlCommand("select au_lname, au_fname, state from authors where dbo.authors.state = 'CA'");

                try
                {
                    //you don’t need to write a finally block — the using statement
                    //releases the object you’re using even if you exit the block 
                    //as the result of an unhandled exception.
                    using (myConnection)
                    {
                        if (myConnection != null)
                        {

                            result += "DataBase Connection:" + myConnection.Database;
                            result += "<br />";
                            result += "DataSource:" + myConnection.DataSource;
                            result += "<br />";
                            result += "SqlConnection State:" + myConnection.State;
                            myConnection.Close();
                            result += "<br />After .close() method...SqlConnection State:" + myConnection.State;

                        }
                    }
                }
                catch (SqlException ex)
                {
                    Print_Exception(ex);
                }
                catch (Exception ex)
                {
                    Print_Exception(ex);
                }
            }
            catch (NullReferenceException ex)
            {
                Print_Exception(ex);

            }
            catch (Exception ex)
            {
                Print_Exception(ex);
            }

            lblResults.Text = result;

        }

        private void Print_Exception(Exception ex)
        {
            System.Diagnostics.Debug.Print("****************************EXCEPTION********************");
            System.Diagnostics.Debug.Print(ex.Message);
            result = ex.Message;
        }
    }
}