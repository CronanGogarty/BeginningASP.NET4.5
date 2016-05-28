<%@ Page Title="ConnectionString in Web.config" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="ConnectionStoredInWebConfig.aspx.cs" Inherits="BeginningASP.NET4._5.ADO.NET.ConnectionStoredInWebConfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
    <p>In this ConnectionString example the ConnectionString property is set in Web.config.<br /><br />
        The SQL query is hard-coded in the .aspx.cs file.
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Output the surrent status of the SqlConnection object.
        <br />
        <asp:Label runat="server" ID="lblResults"></asp:Label>
    </p>
</asp:Content>
