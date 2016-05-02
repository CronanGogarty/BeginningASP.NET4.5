<%@ Page Title="" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="SQLDataSource.aspx.cs" Inherits="BeginningASP.NET4._5.DataBinding.SQLDataSource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource runat="server" ID="sqlDataSource1" ProviderName="System.Data.SqlClient" ConnectionString="<%$ ConnectionStrings:Pubs %>" SelectCommand="SELECT * FROM dbo.authors"></asp:SqlDataSource>
    <asp:DropDownList AutoPostBack="true" runat="server" ID="selAuthors" DataSourceID="sqlDataSource1" DataTextField="au_lname" DataValueField="au_id"></asp:DropDownList>
    <br />
    <asp:SqlDataSource runat="server" ID="sqlDataSourceAuthorDetails" ProviderName="System.Data.SqlClient" ConnectionString="<%$ ConnectionStrings:Pubs %>" SelectCommand="SELECT * FROM dbo.authors WHERE au_id=@AuthorID">
        <SelectParameters>
            <asp:ControlParameter ControlID="selAuthors" Name="AuthorID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListBox runat="server" ID="lstBxAuthorDetails" DataSourceID="sqlDataSourceAuthorDetails" DataTextField="au_fname"></asp:ListBox>
    <br />



    <p>ASP:DetailsView</p>
    <asp:SqlDataSource runat="server" ID="ProductNamesDataSource" ConnectionString="<%$ ConnectionStrings:Northwind %>" SelectCommand="Select ProductName, ProductID FROM Products">
        
    </asp:SqlDataSource>
    <asp:DropDownList runat="server" ID="selProducts" DataSourceID="ProductNamesDataSource" DataTextField="ProductName" DataValueField="ProductID" AutoPostBack="true"></asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="NorthwindDataSource" ConnectionString="<%$ ConnectionStrings:Northwind %>" SelectCommand="SELECT * FROM Products WHERE ProductId=@ProductID">
        <SelectParameters>
            <asp:ControlParameter ControlID="selProducts" Name="ProductID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView runat="server" ID="DetailsView1" DataSourceID="NorthwindDataSource"></asp:DetailsView>
</asp:Content>
