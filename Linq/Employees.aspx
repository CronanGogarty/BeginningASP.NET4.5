<%@ Page Title="LINQ to Objects" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="BeginningASP.NET4._5.Linq.Employees" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <style>
        input[type=submit]  {
            text-align:left;
        }
    </style>
    <p>An example of using Linq to query an object stored in memory.<br /><br />
        When the page loads, a strongly-typed List object is created and populated with objects of type <a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/Linq/Employee.cs" target="_blank">Customer</a> and bound to a GridView control.<br />
        Clicking the various buttons will filter based on the criteria specified.<br />

    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button runat="server" ID="cmdGetMatches" Text="Return users where title == 'Mr'" OnClick="cmdGetMatches_Click" />
    <br />
    <asp:Button runat="server" ID="cmdAnonymousTypes" Text="blank" OnClick="cmdAnonymousTypes_Click" />
    <br />
    <asp:Button runat="server" ID="cmdRetrieveDefinedType" Text="blank" OnClick="cmdRetrieveDefinedType_Click" />
    <br />
    <asp:Button runat="server" ID="cmdFilterByMethod" Text="blank" OnClick="cmdFilterByMethod_Click" />
    <br />
    <asp:Button runat="server" ID="cmdReturnAllEmployees" Text="blank" OnClick="cmdReturnAllEmployees_Click" />
    <br /><br />
    <asp:GridView runat="server" ID="gridMatches"></asp:GridView>
</asp:Content>

