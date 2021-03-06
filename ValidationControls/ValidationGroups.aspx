﻿<%@ Page Title="Validation Groups" MasterPageFile="~/BasicTemplate.Master" Language="C#" AutoEventWireup="true" CodeBehind="ValidationGroups.aspx.cs" Inherits="BeginningASP.NET4._5.ValidationControls.ValidationGroups" %>


<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>This page demonstrates grouping the ASP.NET Validation controls.<br /><br />Each section of the form is treated as a seperate group.<br /><br />
        
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .divInput span[id$="Validator"] {
            color:red;
            padding-right:0.3em;
        }
    </style>
    <div>
        <div class="divInput">
            <label id="lblFirstName">First Name:</label>&nbsp;<asp:TextBox runat="server" ID="txtFirstName"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="vldFirstNameRqdFieldValidator" ControlToValidate="txtFirstName" ErrorMessage="First name cannot be blank" ValidationGroup="vldUserDetailsValidationGroup" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CustomValidator runat="server" ID="vldFirstNameCustomValidator" ControlToValidate="txtFirstName" ErrorMessage="First Name must be 2 characters or more" OnServerValidate="vldFirstNameCustomValidator_ServerValidate" ClientValidationFunction="Function_ValidateFirstNameLength" ValidationGroup="vldUserDetailsValidationGroup" Display="Dynamic"></asp:CustomValidator>
        </div>
        <div class="divInput">
            <label for="txtLastName">Last Name:</label>&nbsp;<asp:TextBox runat="server" ID="txtLastName"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="vldLastNameRqdFieldValidator" ControlToValidate="txtLastName" ErrorMessage="Last name cannot be blank" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CustomValidator runat="server" ID="vldLastNameCustomValidator" ControlToValidate="txtLastName" ErrorMessage="Last name must be 2 characters or more" OnServerValidate="vldLastNameCustomValidator_ServerValidate" ClientValidationFunction="Function_ValidateLastNameLength" ValidationGroup="vldUserDetailsValidationGroup" Display="Dynamic"></asp:CustomValidator>
        </div>
        <div class="divInput">
            <asp:Button runat="server" ID="cmdValidateName" ValidationGroup="vldUserDetailsValidationGroup" OnClick="cmdValidateName_Click" Text="Validate User Name" /></div>
        <div class="divInput">
            <label for="txtEmail">Email address:</label>&nbsp;<asp:TextBox runat="server" ID="txtEmail" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="vldEmailRqdFieldValidator" ControlToValidate="txtEmail" ErrorMessage="Email cannot be blank" ValidationGroup="vldEmailValidationGroup" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="vldEmailRegExpValidator" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid email" ValidationGroup="vldEmailValidationGroup" ValidationExpression="\S+@\S+\.\S+" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>
        <div class="divInput">
            <asp:Button runat="server" ID="cmdValidateEmail" ValidationGroup="vldEmailValidationGroup" OnClick="cmdValidateEmail_Click" Text="Validate Email" />
        </div>
        <asp:Label runat="server" ID="lblOutput"></asp:Label>
    </div>


    <script>
        function Function_ValidateFirstNameLength(objSource, objArgs) {
            var string = objArgs.Value;
            if (string.length < 2) {
                objArgs.IsValid = false;
            }
        }

        function Function_ValidateLastNameLength(objSource, objArgs) {
            var string = objArgs.Value;
            if (string.length < 2) {
                objArgs.IsValid = false;
            }
        }
    </script>
</asp:Content>
