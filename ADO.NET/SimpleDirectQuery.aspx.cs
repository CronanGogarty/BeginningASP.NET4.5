using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BeginningASP.NET4._5.ADO.NET
{
    public partial class SimpleDirectQuery : System.Web.UI.Page
    {
        string result;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                try
                {
                    SqlConnection myConnection = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=pubs;Integrated Security=True");

                    try
                    {
                        myConnection.Open();

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
                    catch (SqlException ex)
                    {
                        Print_Exception(ex);
                    }
                    catch (Exception ex)
                    {
                        Print_Exception(ex);
                    }
                    finally
                    {
                        myConnection.Close();
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

                lblResults.Text = result;
            }

        }

        private void Print_Exception(Exception ex)
        {
            System.Diagnostics.Debug.Print("****************************EXCEPTION********************");
            System.Diagnostics.Debug.Print(ex.Message);
            result = ex.Message;
        }
    }
}