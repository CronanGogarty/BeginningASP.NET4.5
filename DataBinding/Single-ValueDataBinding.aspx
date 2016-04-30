<%@ Page Title="" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Single-ValueDataBinding.aspx.cs" Inherits="BeginningASP.NET4._5.DataBinding.Single_ValueDataBinding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>DataBound public variable = <%# ExpressionToBind %></p>
    <p>DataBound Object.Property: Request.Browser.Browser = <%# Request.Browser.Browser %></p>
    <p>DataBound protected method that returns a string = <%# GetString() %></p>
    <p>DataBound expressions that performs a calculation : 12 + (2 * 6) = <%# 12 + (2 * 6) %></p>

</asp:Content>

