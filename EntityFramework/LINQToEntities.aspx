<%@ Page Title="LINQ To Entities" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="LINQToEntities.aspx.cs" Inherits="BeginningASP.NET4._5.EntityFramework.LINQToEntities" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <%--<h2>LINQ To Entities</h2>--%>
    <p>Using LINQ to Entities, you can write queries that act on your database.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView runat="server" ID="gridView1"></asp:GridView>
    <br />
    <asp:Button runat="server" ID="cmdHideGrid" Text="Hide Grid" OnClick="cmdHideGrid_Click"/>
    <hr />
    <asp:DropDownList runat="server" ID="ddlSelectCategory" AutoPostBack="true" OnSelectedIndexChanged="ddlSelectCategory_SelectedIndexChanged" AppendDataBoundItems="true">
        <asp:ListItem Value="-1" Text="Select a Category"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:GridView runat="server" ID="gridViewCategoryProducts"></asp:GridView>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</asp:Content>

