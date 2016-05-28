<%@ Page Title="QueryString Example - Sending" MasterPageFile="~/BasicTemplate.Master" Language="C#" AutoEventWireup="true" CodeBehind="QueryStringSender.aspx.cs" Inherits="BeginningASP.NET4._5.CrossPagePosting.QueryStringSender" %>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>This is a simple example of transferring data between ASP.NET pages using the QueryString.<br /><br />
        Select a product from the listbox, toggle "Show detailed results" on or off and click "Show Product" to pass the values via the QueryString.
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:ListBox ID="lstProducts" runat="server" Width="200" Height="200">
        </asp:ListBox>
        <br />
        <label for="chkShowDetails">Show detailed results</label>
        <asp:CheckBox ID="chkShowDetails" runat="server" Checked="true" />
        <br />
        <asp:Button ID="cmdSendQuery" runat="server" Text="Show Product" OnClick="cmdSendQuery_Click" />
    </div>
    </asp:Content>
