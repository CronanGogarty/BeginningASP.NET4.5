<%@ Page Title="SQLDataSource" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="SQLDataSource.aspx.cs" Inherits="BeginningASP.NET4._5.DataBinding.SQLDataSource" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>An example of using the SqlDataSource to bind data from a database to controls.
        <br /><br />
        All the ConnectionString and SQLCommand properties are set in the .aspx file, there is no code in the codebehind page.<br />

    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource runat="server" ID="sqlDataSource1" ProviderName="System.Data.SqlClient" ConnectionString="<%$ ConnectionStrings:Northwind %>" SelectCommand="SELECT * FROM dbo.authors"></asp:SqlDataSource>
    <label for="selAuthors">Select author lastname:</label><br /><asp:DropDownList AutoPostBack="true" runat="server" ID="selAuthors" DataSourceID="sqlDataSource1" DataTextField="au_lname" DataValueField="au_id"></asp:DropDownList>
    <br />
    <label for="sqlDataSourceAuthorDetails">To see the author's firstname:</label><br />
    <asp:SqlDataSource runat="server" ID="sqlDataSourceAuthorDetails" ProviderName="System.Data.SqlClient" ConnectionString="<%$ ConnectionStrings:Northwind %>" SelectCommand="SELECT * FROM dbo.authors WHERE au_id=@AuthorID">
        <SelectParameters>
            <asp:ControlParameter ControlID="selAuthors" Name="AuthorID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListBox runat="server" ID="lstBxAuthorDetails" DataSourceID="sqlDataSourceAuthorDetails" DataTextField="au_fname"></asp:ListBox>
    <br />

    <hr />

    <p>Binding to an ASP:DetailsView</p>
    <asp:SqlDataSource runat="server" ID="ProductNamesDataSource" ConnectionString="<%$ ConnectionStrings:Northwind %>" SelectCommand="Select ProductName, ProductID FROM Products">
        
    </asp:SqlDataSource>
    <label for="selProducts">Select a product:</label><br />
    <asp:DropDownList runat="server" ID="selProducts" DataSourceID="ProductNamesDataSource" DataTextField="ProductName" DataValueField="ProductID" AutoPostBack="true"></asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="NorthwindDataSource" ConnectionString="<%$ ConnectionStrings:Northwind %>" SelectCommand="SELECT * FROM Products WHERE ProductId=@ProductID">
        <SelectParameters>
            <asp:ControlParameter ControlID="selProducts" Name="ProductID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br />
    <label for="DetailsView1">Product details:</label><br />
    <asp:DetailsView runat="server" ID="DetailsView1" DataSourceID="NorthwindDataSource"></asp:DetailsView>
</asp:Content>
