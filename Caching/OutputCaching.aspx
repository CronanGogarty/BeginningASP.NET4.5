﻿<%@ Page Title="Output Caching" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="OutputCaching.aspx.cs" Inherits="BeginningASP.NET4._5.Caching.OutputCaching" %>
<%@ OutputCache Duration="20" VaryByParam="ProductID;CurrencyType" %>


<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>Output Caching</p>
    <!-- this page will be cached for 20 seconds;  -->
    <!-- VaryByParam=None means that parameters in the QueryString will still load the cached page -->
    <!-- VaryByParam="*" means that ASP.NET will cache separate copies of the page for different query string arguments -->
    <!-- VaryByParam="ProductID;CurrencyType" means that ASP.NET will cache copies of page for those specific paramters -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblDate"></asp:Label>
</asp:Content>

