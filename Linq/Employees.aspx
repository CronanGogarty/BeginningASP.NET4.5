<%@ Page Title="LINQ to Objects" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="BeginningASP.NET4._5.Linq.Employees" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <%--<h2>Create a collection of employee objects</h2>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button runat="server" ID="cmdGetMatches" Text="Return all users with 'Mr' as the title" OnClick="cmdGetMatches_Click" />
    <br />
    <asp:Button runat="server" ID="cmdAnonymousTypes" Text="Return users with 'Mr' as title in a new anonymous type" OnClick="cmdAnonymousTypes_Click" />
    <br />
    <asp:Button runat="server" ID="cmdRetrieveDefinedType" Text="Return users with 'Mr' as title in a previously defined type" OnClick="cmdRetrieveDefinedType_Click" />
    <br />
    <asp:Button runat="server" ID="cmdFilterByMethod" Text="Filter using a custom method" OnClick="cmdFilterByMethod_Click" />
    <br />
    <asp:Button runat="server" ID="cmdReturnAllEmployees" Text="Return all employees - Order by FirstName, LastName" OnClick="cmdReturnAllEmployees_Click" />
    <br /><br />
    <asp:GridView runat="server" ID="gridMatches"></asp:GridView>
</asp:Content>

