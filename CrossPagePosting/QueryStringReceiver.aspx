<%@ Page Title="QueryString Example - Receiving" MasterPageFile="~/BasicTemplate.Master" Language="C#" AutoEventWireup="true" CodeBehind="QueryStringReceiver.aspx.cs" Inherits="BeginningASP.NET4._5.CrossPagePosting.QueryStringReceiver" %>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>This is a simple example of transferring data between ASP.NET pages using the QueryString and using the cookies collection to store data.<br /><br />
        The output below shows the product you selected in the previous page and whether you toggled "ShowDetails" on or off.
        <br /><br />
        You can choose to store the product you passed via the QueryString in the cookies collection by clicking "Place Product Name in Cookie", this will create a cookie named "ProductCookie" and store the product name as the value in that cookie.<br />
        Click "Retrieve Product Cookie" to retrieve the value stored in ProductCookie. You may clear the ProductCookie from the cookies collection by clicking "Remove Cookie", if you click "Retrieve Cookie" after the cookie has been removed you will see the message "That cookie does not exist".
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
</asp:Content>
