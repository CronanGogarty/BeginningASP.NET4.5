<%@ Page Title="Consume Database Utility Component" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="ConsumeDBUtil.aspx.cs" Inherits="BeginningASP.NET4._5.Components.ConsumeDBUtil" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>Consume Database Utility Component.</p>
    <p>All this component does is retrieve a list of product categories from the database.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList runat="server" ID="ddlCategories"></asp:DropDownList>
</asp:Content>

