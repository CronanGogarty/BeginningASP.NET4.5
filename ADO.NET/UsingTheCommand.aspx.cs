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
    public partial class UsingTheCommand : System.Web.UI.Page
    {
        private static string connectionString = "";
        private string result, errorMessage = "";
        bool errorRaised = false;
        SqlConnection conn;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                using (conn)
                {
                    connectionString =  WebConfigurationManager.ConnectionStrings["Pubs"].ConnectionString;
                    conn = new SqlConnection(connectionString);

                    cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "select au_lname, au_fname, state from authors where dbo.authors.state = 'CA'";

                    //open connection at the latest possible point
                    conn.Open();
                    SqlDataReader reader =  cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        result += reader[0] + ", " + reader[1] + ", " + reader[2] + "<br />";
                    }
                    conn.Close();
                }

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

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (errorRaised)
            {
                lblExceptionMesssage.Visible = true;
                lblExceptionMesssage.Text = errorMessage;
            }

            lblResult.Text = result;
        }

        private void printExceptions(Exception ex)
        {
            System.Diagnostics.Debug.Print("*************************EXCEPTION************************");
            System.Diagnostics.Debug.Print(ex.Message);
            errorRaised = true;
        }
    }
}

