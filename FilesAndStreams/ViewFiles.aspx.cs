using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace BeginningASP.NET4._5.FilesAndStreams
{
    public partial class ViewFiles : System.Web.UI.Page
    {
        private string dir, result, errorMessage = "";
        bool errorRaised = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            dir = Path.Combine(Request.PhysicalApplicationPath, "FilesAndStreams\\Files");

            if (!Page.IsPostBack)
            {
                try
                {
                    string[] fileList = Directory.GetFiles(dir);


                    //for (int i = 0; i < fileList.Length; i++)
                    //{
                    //    int index = fileList[i].LastIndexOf("Beginning");
                    //    string fileStr = "~/" + fileList[i].Substring(index);
                    //    fileStr = fileStr.Replace("\\", "/");
                    //    fileList[i] = fileStr;
                    //}

                    lstViewFiles.DataSource = fileList;
                    lstViewFiles.DataBind();
                }
                catch (DirectoryNotFoundException ex)
                {
                    printExceptions(ex);
                }
                catch (Exception ex)
                {
                    printExceptions(ex);
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

        protected void lstViewFiles_SelectedIndexChanged(object sender, EventArgs e)
        {
            string file = lstViewFiles.SelectedItem.Text;
            
            System.Text.StringBuilder outputString = new System.Text.StringBuilder();
            outputString.Append("<strong>");
            outputString.Append(file);
            outputString.Append("</strong><br />");
            outputString.Append("Created: ");
            outputString.Append(File.GetCreationTime(file).ToString());

            lblFileDetails.Text = outputString.ToString();
        }
    }
}