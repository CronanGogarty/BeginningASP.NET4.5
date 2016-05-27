<%@ Page Title="DataSet Caching" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="DataSetCaching.aspx.cs" Inherits="BeginningASP.NET4._5.Caching.DataSetCaching" %>


<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:CheckBoxList runat="server" ID="chkColumns"></asp:CheckBoxList>
    <br />
    <asp:Button runat="server" ID="cmdFilter" Text="Filter and Show" OnClick="cmdFilter_Click" />
    <asp:GridView runat="server" ID="gridCustomers"></asp:GridView>
    <br />
    <asp:Label runat="server" ID="lblCacheStatus"></asp:Label>
</asp:Content>

