using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BeginningASP.NET4._5.Components
{
    public partial class ConsumeDBUtil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BeginningASPNET45Components.DatabaseComponent.DBUtil dbc = new BeginningASPNET45Components.DatabaseComponent.DBUtil();
                try
                {
                    ddlCategories.DataSource = dbc.GetCategories();
                    ddlCategories.DataTextField = "CategoryName";
                    ddlCategories.DataValueField = "CategoryID";
                    ddlCategories.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.Print(ex.Message);
                }
                
            }
        }
    }
}