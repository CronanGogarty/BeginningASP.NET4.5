using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace BeginningASP.NET4._5.RichControls
{
    public partial class MultiView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;

                string[] colors = Enum.GetNames(typeof(KnownColor));
                for (int i = 0; i < colors.Length; i++)
                {
                    selForeground.Items.Add(colors[i]);
                }
            }
        }
    }
}