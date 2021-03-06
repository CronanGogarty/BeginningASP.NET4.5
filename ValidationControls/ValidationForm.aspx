﻿<%@ Page Title="Validation Form" MasterPageFile="~/BasicTemplate.Master" Language="C#" AutoEventWireup="true" CodeBehind="ValidationForm.aspx.cs" Inherits="BeginningASP.NET4._5.ValidationControls.ValidationForm" %>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>This page demonstrates the ASP.NET Validation controls<br /><br />
        Attempt to submit the form without entering any values, the form will not submit and the Validation controls will display a list of requirements for the form to validate. Follow the instructions provided by the validation control messages in order to submit the form.
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
            <label for="txtUserName">User Name:</label>&nbsp;<asp:TextBox runat="server" ID="txtUserName"></asp:TextBox>
            <asp:RequiredFieldValidator
                runat="server"
                ID="vldUserNameRqdFieldValidator"
                ControlToValidate="txtUserName"
                ErrorMessage="User Name cannot be blank" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="divInput">
            <label for="txtPassword">Password:</label>&nbsp;<asp:TextBox runat="server" ID="txtPassword" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator
                runat="server"
                ID="vldPasswordRqdFieldValidator"
                ErrorMessage="Password cannot be blank"
                ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="divInput">
            <label for="txtRepeatPassword">Re-type Password:</label>&nbsp;<asp:TextBox runat="server" TextMode="Password" ID="txtRepeatPassword"></asp:TextBox>
            <asp:CompareValidator
                runat="server"
                ID="vldRepeatPasswordCompareValidator"
                ControlToValidate="txtRepeatPassword"
                ControlToCompare="txtPassword"
                ErrorMessage="Passwords do not match" Display="Dynamic"></asp:CompareValidator>
            <asp:RequiredFieldValidator
                runat="server"
                ID="vldRepeatPasswordRqdFieldValidator"
                ControlToValidate="txtRepeatPassword"
                ErrorMessage="Re-type your password" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="divInput">
            <label for="txtEmail">Email:</label>&nbsp;<asp:TextBox runat="server" ID="txtEmail" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator
                runat="server"
                ID="vldEmailRqdFieldValidator"
                ControlToValidate="txtEmail"
                ErrorMessage="Email address cannot be blank" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator
                runat="server"
                ID="vldEmailRegExpValidator"
                ControlToValidate="txtEmail"
                ValidationExpression="\S+@\S+\.\S+"
                ErrorMessage="Please enter a valid email address" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>
        <div class="divInput">
            <label for="txtAge">Age:</label>&nbsp;<asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator
                runat="server"
                ID="vldAgeRqdFieldValidator"
                ControlToValidate="txtAge"
                ErrorMessage="Age cannot be blank" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RangeValidator
                runat="server"
                ID="vldAgeRangeValidator"
                ControlToValidate="txtAge"
                MinimumValue="18"
                MaximumValue="99"
                ErrorMessage="Age must be between 18 - 99" Display="Dynamic"></asp:RangeValidator>
        </div>
        <div class="divInput">
            <label for="txtReferrer">Referrer Code:</label>&nbsp;<asp:TextBox runat="server" ID="txtReferrer"></asp:TextBox>
            <asp:CustomValidator
                runat="server"
                ID="vldReferrerCustomValidator"
                ControlToValidate="txtReferrer"
                ErrorMessage="Referrer code must begin with 014"
                ClientValidationFunction="MyCustomValidation"
                OnServerValidate="vldReferrerCustomValidator_ServerValidate" Display="Dynamic"></asp:CustomValidator>
        </div>
        <div class="divInput">
            <asp:Button runat="server" ID="cmdSubmit" Text="Submit" OnClick="cmdSubmit_Click" />&nbsp;<asp:Button runat="server" ID="cmdCancel" CausesValidation="false" Text="Cancel" OnClick="cmdCancel_Click" />
        </div>
        <asp:Label runat="server" ID="lblResult"></asp:Label>
    </div>

    <script>
        function MyCustomValidation(objSource, objArgs) {
            console.log("Function running....");

            var number = objArgs.Value;
            number = number.substr(0, 3);

            if (number % 7 == 0) {
                objArgs.IsValid = true;
            }
            else {
                objArgs.IsValid = false;
            }
        }
    </script>
</asp:Content>
