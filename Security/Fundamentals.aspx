<%@ Page Title="Security Fundamentals" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Fundamentals.aspx.cs" Inherits="BeginningASP.NET4._5.Security.Fundamentals" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>This is an example of a secured page.<br /><br />

        You can see this page because you have been authenticated.<br />
        When you tried to access this page prior to authentication, you were redirected to the login page because the contents of this directory are not accessible for anonymous users.<br />
        To logout simply click "Logout". The BeginningASPNET45SecurityCookie will be expired and you will no longer be authenticated - you will be redirected to the login page.

    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
    <br />
    <asp:Button runat="server" ID="cmdLogout" Text="Logout" OnClick="cmdLogout_Click" />
</asp:Content>