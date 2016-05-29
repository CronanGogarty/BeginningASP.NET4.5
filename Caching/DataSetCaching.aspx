<%@ Page Title="DataSet Caching" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="DataSetCaching.aspx.cs" Inherits="BeginningASP.NET4._5.Caching.DataSetCaching" %>


<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>When the page loads, a DataSet object is created.<br />
        The top 10 records are selected from the "Customers" table and placed in the DataSet, this DataSet is then stored in Cache["Customers"].<br />
        The CheckBoxList is populated with the names of the columns in the "Customers" DataSet.<br />
        <br />
        When you click "Filter and Show", the "Customers" DataSet is retrieved from cache and copied into a new DataSet object. This allows you to modify the copied DataSet without affecting what is stored in cache.<br />
        <br />
        Selected columns will be removed from the DataSet and the remaining columns will be displayed when the DataSet is bound to the GridView control.
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:CheckBoxList runat="server" ID="chkColumns"></asp:CheckBoxList>
    <br />
    <asp:Button runat="server" ID="cmdFilter" Text="Filter and Show" OnClick="cmdFilter_Click" />
    <asp:GridView runat="server" ID="gridCustomers"></asp:GridView>
    <br />
    <asp:Label runat="server" ID="lblCacheStatus"></asp:Label>
</asp:Content>

