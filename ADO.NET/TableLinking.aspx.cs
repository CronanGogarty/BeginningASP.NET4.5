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
    public partial class TableLinking : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataSet dataset;
        private static string connectionString = WebConfigurationManager.ConnectionStrings["Northwind"].ToString();
        private string result, errorMessage, commandText = "";
        private bool errorRaised, connectionOpen = false;

        private bool openConnection()
        {
            conn = new SqlConnection(connectionString);
            cmd = new SqlCommand();
            cmd.Connection = conn;
            adapter = new SqlDataAdapter(cmd);
            dataset = new DataSet();

            conn.Open();

            return (conn.State.ToString().ToUpper() == "OPEN") ? true : false;
        }
            

        private void printExceptions(Exception ex)
        {
            System.Diagnostics.Debug.Print("*************************EXCEPTION************************");
            System.Diagnostics.Debug.Print(ex.Message);

            errorMessage = ex.Message;
            errorRaised = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                connectionOpen = openConnection();

                if (connectionOpen)
                {
                    using (conn)
                    {
                        //populate the dataset object with three tables of data
                        cmd.CommandText = "SELECT au_lname, au_fname, au_id FROM Authors";
                        adapter.Fill(dataset, "Authors");

                        cmd.CommandText = "SELECT au_id, title_id FROM TitleAuthor";
                        adapter.Fill(dataset, "TitleAuthor");

                        cmd.CommandText = "SELECT title_id, title FROM Titles";
                        adapter.Fill(dataset, "Titles");

                        //now lets define a DataRelation object to map the relationships between the tables in the dataset
                        //To create a DataRelation, you need to specify the linked fields from two tables, 
                        //and you need to give your DataRelation a unique name.
                        //The order of the linked fields is important. 
                        //The first field is the parent, and the second field is the child.
                        //one parent can have many children, but each child can have only one parent
                        DataRelation Titles_TitleAuthor = new DataRelation(
                                                "Titles_TitleAuthor", //give the relationship a title
                                                dataset.Tables["Titles"].Columns["title_id"], //define the parent
                                                dataset.Tables["TitleAuthor"].Columns["title_id"]); //define the child

                        DataRelation Author_TitleAuthor = new DataRelation("Author_TitleAuthor", dataset.Tables["Authors"].Columns["au_id"], dataset.Tables["TitleAuthor"].Columns["au_id"]);

                        //After you’ve created these DataRelation objects, you must add them to the DataSet:
                        dataset.Relations.Add(Titles_TitleAuthor);
                        dataset.Relations.Add(Author_TitleAuthor);

                        //loop through all the authors in the Authors table
                        foreach (DataRow rowAuthor in dataset.Tables["Authors"].Rows)
                        {
                            string authorFName = rowAuthor["au_fname"].ToString();
                            string authorLName = rowAuthor["au_lname"].ToString();
                            string title = "";

                            //loop through all the childrows for this 
                            foreach (DataRow rowTitleAuthor in rowAuthor.GetChildRows(Author_TitleAuthor))
                            {
                                DataRow rowTitle = rowTitleAuthor.GetParentRows(Titles_TitleAuthor)[0];
                                title += rowTitle["title"].ToString() + "<br />";
                            }

                            result += "<strong>Author Name: " + authorFName + " " + authorLName + "</strong><br />";
                            if (title != "")
                            {
                                result += "<em>Titles: </em>" + title;
                            }
                            else
                            {
                                result += "<em>No titles found</em><br />";
                            }
                            result += "<br />";
                        }
                    }
                }
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
            finally {
                conn.Close();
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if ((result != null) && (result != ""))
            {
                lblResult.Text = result;
            }
        }
    }
}