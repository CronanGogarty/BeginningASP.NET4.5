<%@ Page Title="" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BeginningASP.NET4._5.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #ContentPlaceHolder1_valUsernameRqdFieldValidator,
        #ContentPlaceHolder1_valPasswordRqdFieldValidator   {
            color:#f00;
            float:right;
            margin-right:0.1em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>Login</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divInput">
        <label for="txtUserName">Username:</label>&nbsp;<asp:TextBox runat="server" ID="txtUserName"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="valUsernameRqdFieldValidator" ControlToValidate="txtUserName" Text="Username cannot be empty"></asp:RequiredFieldValidator>
    </div>
    <div class="divInput">
        <label for="txtPassword">Password:</label>&nbsp;<asp:TextBox runat="server" ID="txtPassword"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="valPasswordRqdFieldValidator" ControlToValidate="txtPassword" ErrorMessage="Password cannot be empty "></asp:RequiredFieldValidator>
    </div>
    <div class="divInput">
        <asp:Button runat="server" ID="cmdSubmit" Text="Login" OnClick="cmdSubmit_Click" CausesValidation="true" />
    </div>
    <br />
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</asp:Content>
