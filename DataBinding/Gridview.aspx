<%@ Page Title="Gridview Databinding" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Gridview.aspx.cs" Inherits="BeginningASP.NET4._5.DataBinding.Gridview" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>
        Using the SqlDataSource object again, this time to bind to the GridView control and the DetailsView control.<br />
        <br />
        Select a product from the dropdown list to see the product details in the GridView and DetailsView.<br />
        Click "Edit" in the DetailsView to edit the product - click "Update" to commit your changes to the database.
    </p>
</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1">

    <asp:SqlDataSource runat="server"
        ID="ProductListDataSource"
        ProviderName="System.Data.SqlClient"
        ConnectionString="<%$ ConnectionStrings:Northwind %>"
        SelectCommand="SELECT ProductName, ProductID FROM Products"></asp:SqlDataSource>

    <asp:DropDownList
        runat="server"
        ID="selProducts"
        DataSourceID="ProductListDataSource"
        DataTextField="ProductName"
        DataValueField="ProductID"
        AutoPostBack="true">
    </asp:DropDownList>
    <br />
    <br />

    <asp:SqlDataSource
        ID="SqlDataSource1"
        runat="server"
        ProviderName="System.Data.SqlClient"
        ConnectionString="<%$ ConnectionStrings:Northwind %>"
        SelectCommand="SELECT * FROM Products WHERE ProductID=@ProductID"
        UpdateCommand="UPDATE Products SET ProductName=@ProductName, UnitPrice=@UnitPrice, UnitsInStock=@UnitsInStock, UnitsOnOrder=@UnitsOnOrder, ReorderLevel=@ReorderLevel, Discontinued=@Discontinued WHERE ProductID=@ProductID AND ProductName=@original_ProductName AND UnitPrice=@original_UnitPrice AND UnitsInStock=@original_UnitsInStock AND UnitsOnOrder=@original_UnitsOnOrder AND ReorderLevel=@original_ReorderLevel AND Discontinued=@original_Discontinued"
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original_{0}"
        OnUpdated="SqlDataSource1_Updated">
        <SelectParameters>
            <asp:ControlParameter ControlID="selProducts" Name="ProductID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView runat="server" 
        ID="GridViewProductDetails" 
        DataSourceID="SqlDataSource1" 
        AutoGenerateColumns="False" 
        DataKeyNames="ProductID">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="SupplierID" HeaderText="SpplrID" SortExpression="SupplierID" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
            <asp:BoundField DataField="QuantityPerUnit" HeaderText="QtyPerUnit" SortExpression="QuantityPerUnit" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            <asp:BoundField DataField="UnitsInStock" HeaderText="InStock" SortExpression="UnitsInStock" />
            <asp:BoundField DataField="UnitsOnOrder" HeaderText="OnOrder" SortExpression="UnitsOnOrder" />
            <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" SortExpression="ReorderLevel" />
            <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:DetailsView runat="server"
        ID="DeetailsViewProducts"
        DataSourceID="SqlDataSource1"
        AutoGenerateEditButton="True">
    </asp:DetailsView>

    <br />
    <asp:Label runat="server" ID="lblMessage"></asp:Label>

</asp:Content>

