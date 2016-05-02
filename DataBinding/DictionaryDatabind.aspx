<%@ Page Title="Dictionary Databind" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="DictionaryDatabind.aspx.cs" Inherits="BeginningASP.NET4._5.DataBinding.DictionaryDatabind" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>An example of how to databind a Dictionary object to a control.</p>
    <asp:DropDownList runat="server" ID="selNumberedFruit"></asp:DropDownList>
</asp:Content>
