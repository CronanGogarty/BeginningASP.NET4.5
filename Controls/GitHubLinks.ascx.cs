using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.Controls
{
    public partial class GitHubLinks : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filePath = Request.FilePath;
            if (filePath.Substring(1, 1) == "d")
            {
                filePath = filePath.Replace('d', 'D');
            }
            if (filePath.Contains("BeginningASP.NET4.5"))
            {
                int index = filePath.IndexOf("BeginningASP.NET4.5/");
                filePath = filePath.Remove(index, 20);
            }
            string gitAspxPath = "https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master" + filePath;
            string gitCSPath = "https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master" + filePath + ".cs";
            linkGitAspxPath.NavigateUrl = gitAspxPath;
            linkGitAspxPath.Text = "View ASPX code on GitHub";
            linkGitCSPath.NavigateUrl = gitCSPath;
            linkGitCSPath.Text = "View ASPX.CS code on GitHub";
        }
    }
}