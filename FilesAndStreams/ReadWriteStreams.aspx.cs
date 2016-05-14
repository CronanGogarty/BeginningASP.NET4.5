using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace BeginningASP.NET4._5.FilesAndStreams
{
    public partial class ReadWriteStreams : System.Web.UI.Page
    {
        private string result, errorMessage, path, line = "";
        private bool errorRaised;
        StreamReader reader;
        StreamWriter writer;
        FileStream fs;

        protected void Page_Load(object sender, EventArgs e)
        {
            path = Path.Combine(Request.PhysicalApplicationPath, "FilesAndStreams/Files/Chequerboard.txt");
            fs = File.Open(path, FileMode.Open, FileAccess.ReadWrite, FileShare.ReadWrite);
            reader = new StreamReader(fs);
            result = path.ToString();

            if (!Page.IsPostBack)
            {
                try
                {
                    do
                    {
                        line = reader.ReadLine();
                        if (line != null)
                        {
                            txtStreamReader.Text += line;
                            txtStreamReader.Text += "\n\n";
                        }
                    } while (line != null);
                    
                    
                }
                catch (FileNotFoundException ex)
                {
                    printExceptions(ex);
                }
                catch (Exception ex)
                {
                    printExceptions(ex);
                }
                finally
                {
                    fs.Close();
                }
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (result != "")
            {
                lblResult.Text = result;
            }
            if (errorRaised)
            {
                lblErrorMessage.Text = errorMessage;
            }
        }


        private void printExceptions(Exception ex)
        {
            System.Diagnostics.Debug.Print("*************************EXCEPTION************************");
            System.Diagnostics.Debug.Print(ex.Message);

            errorMessage = ex.Message;
            errorRaised = true;
        }

        protected void cmdAppend_Click(object sender, EventArgs e)
        {
            if (txtStreamWriter.Text != "")
            {

                try
                {
                    //TODO: Add the logic to append to existing file.
                }
                catch (Exception ex)
                {
                    printExceptions(ex);
                }
                finally
                {
                    fs.Close();
                }
            }
        }
    }
}