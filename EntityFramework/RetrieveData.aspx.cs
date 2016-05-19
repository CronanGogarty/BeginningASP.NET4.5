using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BeginningASP.NET4._5.EntityDataModels
{
    public partial class RetrieveData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NorthwindEntities1 entities = new NorthwindEntities1();
            try
            {
                gridViewData.DataSource = entities.Products.ToList();
                gridViewData.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.Print(ex.Message);
                lblErrorMessage.Text = ex.Message;
            }
        }
    }
}