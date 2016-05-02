using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.DataBinding
{
    public partial class DictionaryDatabind : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Dictionary<int, string> numberedFruit = new Dictionary<int, string>();
                numberedFruit.Add(1, "Apple");
                numberedFruit.Add(2, "Banana");
                numberedFruit.Add(3, "Kiwi");
                numberedFruit.Add(4, "Orange");

                selNumberedFruit.DataSource = numberedFruit;
                selNumberedFruit.DataTextField = "Value";
                selNumberedFruit.DataValueField = "Key";

                Page.DataBind();
            }
        }
    }
}