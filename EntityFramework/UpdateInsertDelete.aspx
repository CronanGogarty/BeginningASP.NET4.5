<%@ Page Title="Update Insert Delete with Entity Framework" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="UpdateInsertDelete.aspx.cs" Inherits="BeginningASP.NET4._5.EntityFramework.UpdateInsertDelete" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>An example of some common database interactions using the Entity Framework.<br /><br />
        When the page loads, a subset of the columns in the Products table is returned for all products and bound to a GridView.<br />
        You can select a product by clicking "Select" in the appropriate row. When you have selected a product, clicking on "Update" will update the product price by applying a 25% discount.
        <br />
        Clicking on "Insert" will insert a new product named "My New Product" with an ID value of (current highest ID + 1).<br />
        To delete a product, select a product and click "Delete". <strong>Note:</strong> Please delete newly created products.
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
    <br />
    <asp:Button runat="server" ID="cmdUpdate" Text="Update" OnClick="cmdUpdate_Click" />
    &nbsp;
    <asp:Button runat="server" ID="cmdInsert" Text="Insert" OnClick="cmdInsert_Click" />
    &nbsp;
    <asp:Button runat="server" ID="cmdDelete" Text="Delete" OnClick="cmdDelete_Click" />
    <br />
    <asp:GridView runat="server" ID="gridViewProducts" OnRowDataBound="gridViewProducts_RowDataBound" AutoGenerateSelectButton="true" DataKeyNames="ProductID" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    
</asp:Content>

