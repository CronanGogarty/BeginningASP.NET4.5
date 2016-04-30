using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.DataBinding
{
    public partial class Single_ValueDataBinding : System.Web.UI.Page
    {
        public string ExpressionToBind;

        protected void Page_Load(object sender, EventArgs e)
        {
            ExpressionToBind = "This is a public string defined in the Page_Load method.";

            Page.DataBind();
        }

        protected string GetString()
        {
            return "this string has been returned from a method in the codebehind and placed here using Single-Value DataBinding";
        }
    }
}