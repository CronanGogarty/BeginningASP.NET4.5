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
    public partial class DatabaseInteractions : System.Web.UI.Page
    {
        SqlConnection connection;
        SqlCommand command;
        IDataReader reader;
        private string connectionstring = WebConfigurationManager.ConnectionStrings["Northwind"].ConnectionString;
        private string result, errorMessage, au_id = "";
        private bool errorRaised, connectionOpened = false;
        string commandText = "";

        private bool openDatabase()
        {
            try
            {
                connection = new SqlConnection(connectionstring);
                command = new SqlCommand(commandText, connection);
                connection.Open();
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

            return (connection != null) ? true : false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            result = errorMessage = au_id = "";
            errorRaised = connectionOpened = false;
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!Page.IsPostBack)
            {
                try
                {
                    commandText = "Select au_lname, au_fname, au_id from dbo.authors order by au_lname";
                    connectionOpened = openDatabase();

                    if (connectionOpened)
                    {
                        reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            string dbRecord = reader[0] + ", " + reader[1];
                            string listValue = (string)reader[2];
                            ListItem item = new ListItem(dbRecord, listValue);
                            selAuthorList.Items.Add(item);
                        }
                    }
                    else
                    {
                        result = "Connection failed to open";
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
                finally
                {
                    connection.Close();
                }
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (errorRaised)
            {
                lblError.Visible = true;
                lblError.Text = "<br />" + errorMessage;
            }
            if ((result != "") && (result != null))
            {
                lblResult.Visible = true;
                lblResult.Text = "<br />" + result;
            }
        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    if ((txtUniqueID.Text != "") && (txtFirstName.Text != "") && (txtLastName.Text != ""))
                    {

                        //example of using a Parameterized Command - set @CustomerID as the parameter
                        commandText = "UPDATE dbo.authors SET ";
                        commandText += "au_lname=@lname, au_fname=@fname, phone=@phone, address=@address, city=@city, state=@state, zip=@zip, contract=@contract WHERE au_id=@au_id_original";

                        connectionOpened = openDatabase();

                        //add the parameter and the value to the command.Parameters collection
                        command.Parameters.AddWithValue("@lname", txtLastName.Text);
                        command.Parameters.AddWithValue("@fname", txtFirstName.Text);
                        command.Parameters.AddWithValue("@phone", txtPhone.Text);
                        command.Parameters.AddWithValue("@address", txtAddress.Text);
                        command.Parameters.AddWithValue("@city", txtCity.Text);
                        command.Parameters.AddWithValue("@state", txtState.Text);
                        command.Parameters.AddWithValue("@zip", txtZipCode.Text);
                        command.Parameters.AddWithValue("@contract", chkContract.Checked);
                        command.Parameters.AddWithValue("@au_id_original", selAuthorList.SelectedItem.Value);

                        result = commandText;

                        try
                        {
                            if (connectionOpened)
                            {
                                using (connection)
                                {
                                    int number = command.ExecuteNonQuery();
                                    if (number > 0)
                                    {
                                        result = "Number of rows affected: " + number;
                                    }
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
                    }
                    else
                    {
                        errorMessage = "Unique ID field cannot be blank";
                        errorRaised = true;
                    }

                }
                catch (Exception ex)
                {
                    printExceptions(ex);
                }
                finally
                {
                    connection.Close();
                }
            }
            else
            {
                errorMessage = "Page not valid";
                errorRaised = true;
            }
        }

        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    if ((txtUniqueID.Text != "") && (txtFirstName.Text != "") && (txtLastName.Text != ""))
                    {
                        
                        //example of using a Parameterized Command - set @CustomerID as the parameter
                        commandText = "DELETE FROM dbo.authors WHERE au_id = @CustomerID";
                        connectionOpened = openDatabase();

                        //add the parameter and the value to the command.Parameters collection
                        command.Parameters.AddWithValue("@CustomerID", txtUniqueID.Text);
                        result = commandText;

                        try
                        {
                            if (connectionOpened)
                            {
                                using (connection)
                                {
                                    int number = command.ExecuteNonQuery();
                                    if (number > 0)
                                    {
                                        result = "Number of rows affected: " + number;
                                    }
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
                    }
                    else
                    {
                        errorMessage = "Unique ID field cannot be blank";
                        errorRaised = true;
                    }

                }
                catch (Exception ex)
                {
                    printExceptions(ex);
                }
                finally
                {
                    connection.Close();
                }
            }
            else
            {
                errorMessage = "Page not valid";
                errorRaised = true;
            }
        }

        protected void cmdCreateNew_Click(object sender, EventArgs e)
        {
            txtAddress.Text = "";
            txtCity.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPhone.Text = "";
            txtState.Text = "";
            txtUniqueID.Text = "";
            txtZipCode.Text = "";

            chkContract.Checked = false;

            result = "Add new user details then click Insert New to add the record to the database.";
        }

        protected void cmdInsertNew_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string strFname, strLname, strPhone, strAddress, strCity, strState, strZip, strId = "";
                    strFname = txtFirstName.Text;
                    strLname = txtLastName.Text;
                    strPhone = txtPhone.Text;
                    strAddress = txtAddress.Text;
                    strCity = txtCity.Text;
                    strState = txtState.Text;
                    strZip = txtZipCode.Text;
                    strId = txtUniqueID.Text;

                    commandText = "INSERT INTO dbo.authors (au_id, au_lname, au_fname, phone, address, city, state, zip, contract)";
                    commandText += "VALUES('";
                    commandText += strId + "', '" + strLname + "', '" + strFname + "', '" + strPhone + "', '" + strAddress + "', '" + strCity + "', '" + strState + "', '" + strZip + "', '" + Convert.ToInt16(chkContract.Checked) + "')";
                    result = commandText;

                    connectionOpened = openDatabase();

                    if (connectionOpened)
                    {
                        using (connection)
                        {
                            try
                            {
                                int number = command.ExecuteNonQuery();
                                if (number > 0)
                                {
                                    result = "Number of rows affected: " + number;
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
                            finally
                            {
                                connection.Close();
                            }

                        }
                    }
                }

                catch (NullReferenceException ex)
                {
                    printExceptions(ex);
                }
                catch (FormatException ex)
                {
                    printExceptions(ex);
                }
                catch (InvalidCastException ex)
                {
                    printExceptions(ex);
                }
                catch (Exception ex)
                {
                    printExceptions(ex);
                }
            }
            else
            {
                errorMessage = "Page was not validated:<br />No database commands were executed";
                errorRaised = true;
            }
        }

        //will print the exception message to the Visual Studio Output
        //will set the errorMessage text
        //will set the errorRaised bool = true
        //use Page_PreRender to display errorMessage if errorRaised == true
        private void printExceptions(Exception ex)
        {
            System.Diagnostics.Debug.Print("*************************EXCEPTION************************");
            System.Diagnostics.Debug.Print(ex.Message);

            errorMessage = ex.Message;
            errorRaised = true;
        }

        private bool isContractChecked(string readerChecked)
        {
            if (readerChecked.ToUpper() == "TRUE")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void selAuthorList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                au_id = selAuthorList.SelectedItem.Value;
                commandText = string.Format("select * from dbo.authors where au_id = '{0}'", au_id);
                result = commandText;
                //connection = new SqlConnection(connectionstring);
                //command = new SqlCommand(commandText, connection);
                connectionOpened = openDatabase();

                if (connectionOpened)
                {
                    using (connection)
                    {
                        try
                        {
                            reader = command.ExecuteReader();
                            reader.Read();

                            txtUniqueID.Text = reader["au_id"].ToString();
                            txtFirstName.Text = reader["au_fname"].ToString();
                            txtLastName.Text = reader["au_lname"].ToString();
                            txtPhone.Text = reader["phone"].ToString();
                            txtAddress.Text = reader["address"].ToString();
                            txtCity.Text = reader["city"].ToString();
                            txtState.Text = reader["state"].ToString();
                            txtZipCode.Text = reader["zip"].ToString();
                            bool contractChk = isContractChecked(reader["contract"].ToString());
                            if (contractChk)
                            {
                                chkContract.Checked = true;
                            }
                            else
                            {
                                chkContract.Checked = false;
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
                        finally
                        {
                            connection.Close();
                        }
                    }
                }
            }

            catch (NullReferenceException ex)
            {
                printExceptions(ex);
            }
            catch (FormatException ex)
            {
                printExceptions(ex);
            }
            catch (InvalidCastException ex)
            {
                printExceptions(ex);
            }
            catch (Exception ex)
            {
                printExceptions(ex);
            }
        }
    }
}