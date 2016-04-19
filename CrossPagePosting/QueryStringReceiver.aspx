<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryStringReceiver.aspx.cs" Inherits="BeginningASP.NET4._5.CrossPagePosting.QueryStringReceiver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QueryString Example - Receiving</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblProduct" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblShowDetails" runat="server"></asp:Label>
        <br />
        <asp:Button ID="cmdSetCookie" runat="server" Text="Place Product Name in Cookie" OnClick="cmdSetCookie_Click" />
        <br />
        <asp:Button ID="cmdRetrieveCookie" runat="server" Text="Retrieve Product Cookie" OnClick="cmdRetrieveCookie_Click" />
        <br />
        <asp:Label ID="lblRetrievedCookie" runat="server"></asp:Label>
        <br />
        <asp:Button ID="cmdRemoveCookie" runat="server" Text="Remove Cookie" OnClick="cmdRemoveCookie_Click" />
    </div>
    </form>
</body>
</html>
