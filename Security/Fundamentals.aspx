<%@ Page Title="Security Fundamentals" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Fundamentals.aspx.cs" Inherits="BeginningASP.NET4._5.Security.Fundamentals" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
    <br />
    <asp:Button runat="server" ID="cmdLogout" Text="Logout" OnClick="cmdLogout_Click" />
</asp:Content>