<%@ Page Title="Gridview Databinding" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Gridview.aspx.cs" Inherits="BeginningASP.NET4._5.DataBinding.Gridview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Gridview</p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Northwind %>" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}" OnUpdated="SqlDataSource1_Updated" 
        SelectCommand="SELECT * FROM Products WHERE ProductID=@ProductID" 
        UpdateCommand="UPDATE Products SET ProductName=@ProductName, UnitPrice=@UnitPrice, UnitsInStock=@UnitsInStock, UnitsOnOrder=@UnitsOnOrder, ReorderLevel=@ReorderLevel, Discontinued=@Discontinued WHERE ProductID=@ProductID AND ProductName=@original_ProductName AND UnitPrice=@original_UnitPrice AND UnitsInStock=@original_UnitsInStock AND UnitsOnOrder=@original_UnitsOnOrder AND ReorderLevel=@original_ReorderLevel AND Discontinued=@original_Discontinued">
        <SelectParameters>
            <asp:ControlParameter ControlID="selProducts" Name="ProductID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="ProductListDataSource" ConnectionString="<%$ ConnectionStrings:Northwind %>" SelectCommand="SELECT ProductName, ProductID FROM Products"></asp:SqlDataSource>
    <asp:DropDownList runat="server" ID="selProducts" DataSourceID="ProductListDataSource" DataTextField="ProductName" DataValueField="ProductID" AutoPostBack="true"></asp:DropDownList>
    <br />
    <br />
    <asp:GridView runat="server" ID="GridViewProductDetails" DataSourceID="SqlDataSource1"></asp:GridView>
    <br /><br />
    <asp:DetailsView runat="server" ID="DeetailsViewProducts" DataSourceID="SqlDataSource1" AutoGenerateEditButton="true"></asp:DetailsView>
    <br />
    <asp:Label runat="server" ID="lblMessage"></asp:Label>
</asp:Content>

