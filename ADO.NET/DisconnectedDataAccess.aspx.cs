using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;

namespace BeginningASP.NET4._5.ADO.NET
{
    public partial class DisconnectedDataAccess : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataSet dataset;
        private static string connectionString = "";
        string errorMessage, result, commandText = "";
        bool connectionOpen, errorRaised = false;

        private void printExceptions(Exception ex)
        {
            System.Diagnostics.Debug.Print("*************************EXCEPTION************************");
            System.Diagnostics.Debug.Print(ex.Message);

            errorMessage = ex.Message;
            errorRaised = true;
        }

        private bool openConnection()
        {
            
            try
            {
                conn = new SqlConnection(connectionString);
                cmd = new SqlCommand(commandText, conn);
                adapter = new SqlDataAdapter(cmd);
                dataset = new DataSet();

                conn.Open(); 
            }
            catch (SqlException ex)
            {
                printExceptions(ex);
            }
            catch (NullReferenceException ex)
            {
                printExceptions(ex);
            }
            catch (Exception ex)
            {
                printExceptions(ex);
            }

            return (conn != null) ? true : false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    connectionString = WebConfigurationManager.ConnectionStrings["Northwind"].ToString();
                    commandText = "SELECT * FROM dbo.authors ORDER BY au_lname";

                    connectionOpen = openConnection();

                    result = connectionString;

                    if (connectionOpen)
                    {
                        using (conn)
                        {
                            try
                            {
                                adapter.Fill(dataset, "Authors");
                                if (adapter != null)
                                {
                                    result = "Adapter filled";

                                    foreach (DataRow datarow in dataset.Tables["Authors"].Rows)
                                    {
                                        result += "<div class='dbresults'>";
                                        result += "<br />" + datarow["au_lname"] + ", " + datarow["au_fname"];
                                        result += "</div>";
                                    }
                                }
                            }
                            catch (SqlException ex)
                            {
                                printExceptions(ex);
                            }
                            catch (Exception ex)
                            {
                                printExceptions(ex);
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }
                    }

                }
                catch (NullReferenceException ex)
                {
                    printExceptions(ex);
                }
                catch (Exception ex)
                {
                    printExceptions(ex);
                }
                finally
                {
                    //finally block for try/catch opened after Page.IsPostback
                }
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (errorRaised)
            {
                lblError.Text = errorMessage;
            }
            if ((result != "") && (result != null))
            {
                lblResult.Text = result;
            }
        }
    }
}