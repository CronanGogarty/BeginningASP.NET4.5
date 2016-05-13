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
    <asp:GridView runat="server" ID="GridViewProductDetails" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="ProductID">
        <Columns>
            <asp:BoundField DataField ="ProductID" HeaderText ="ID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
<asp:BoundField DataField ="ProductName" HeaderText ="ProductName" SortExpression="ProductName" />
<asp:BoundField DataField ="SupplierID" HeaderText ="SpplrID" SortExpression="SupplierID" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
            <asp:BoundField DataField="QuantityPerUnit" HeaderText="QtyPerUnit" SortExpression="QuantityPerUnit" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            <asp:BoundField DataField="UnitsInStock" HeaderText="InStock" SortExpression="UnitsInStock" />
            <asp:BoundField DataField="UnitsOnOrder" HeaderText="OnOrder" SortExpression="UnitsOnOrder" />
            <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" SortExpression="ReorderLevel" />
            <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued" />
        </Columns>
    </asp:GridView>
    <br /><br />
    <asp:DetailsView runat="server" ID="DeetailsViewProducts" DataSourceID="SqlDataSource1" AutoGenerateEditButton="True" AutoGenerateRows="False" DataKeyNames="ProductID">
        <Fields>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" SortExpression="SupplierID" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
            <asp:BoundField DataField="QuantityPerUnit" HeaderText="QuantityPerUnit" SortExpression="QuantityPerUnit" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" SortExpression="UnitsInStock" />
            <asp:BoundField DataField="UnitsOnOrder" HeaderText="UnitsOnOrder" SortExpression="UnitsOnOrder" />
            <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" SortExpression="ReorderLevel" />
            <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued" />
        </Fields>
    </asp:DetailsView>
    <br />
    <asp:Label runat="server" ID="lblMessage"></asp:Label>
</asp:Content>

