<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryStringSender.aspx.cs" Inherits="BeginningASP.NET4._5.CrossPagePosting.QueryStringSender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QueryString Example - Sending</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListBox ID="lstProducts" runat="server" Width="200" Height="200">

        </asp:ListBox>
        <br />
        <label for="chkShowDetails">Show detailed results</label>
        <asp:CheckBox ID="chkShowDetails" runat="server" Checked="true" />
        <br />
        <asp:Button ID="cmdSendQuery" runat="server" Text="Show Product" OnClick="cmdSendQuery_Click" />
    </div>
    </form>
</body>
</html>
