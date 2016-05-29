<%@ Page Title="Login" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BeginningASP.NET4._5.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #ContentPlaceHolder1_valUsernameRqdFieldValidator,
        #ContentPlaceHolder1_valPasswordRqdFieldValidator   {
            color:#f00;
            float:right;
            margin-right:0.1em;
        }
        #ContentPlaceHolder1_chkPersistentLogin {
            float:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>This is an example of an ASP.NET login page using forms authentication.<br /><br />

        You have been redirected here because you have not been authenticated.<br />
        In order to login simply enter any username and the password "secret".<br />
        To remain logged in even after your session ends, click the "Keep me logged in:" checkbox, this will set a persistent cookie for 14 days.
        <br /><br />

        Obviously in a production environment, the username and password would be stored in encrypted format in a database.

    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divInput">
        <label for="txtUserName">Username:</label>&nbsp;<asp:TextBox runat="server" ID="txtUserName"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="valUsernameRqdFieldValidator" ControlToValidate="txtUserName" Text="Username cannot be empty"></asp:RequiredFieldValidator>
    </div>
    <div class="divInput">
        <label for="txtPassword">Password:</label>&nbsp;<asp:TextBox runat="server" ID="txtPassword" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="valPasswordRqdFieldValidator" ControlToValidate="txtPassword" ErrorMessage="Password cannot be empty "></asp:RequiredFieldValidator>
    </div>
    <div class="divInput">
        <label for="chkPersistentLogin">Keep me logged in:</label>&nbsp;<asp:CheckBox runat="server" ID="chkPersistentLogin" />&nbsp;
        <asp:Button runat="server" ID="cmdSubmit" Text="Login" OnClick="cmdSubmit_Click" CausesValidation="true" />
    </div>
    <br />
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</asp:Content>
