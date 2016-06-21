<%@ Page Title="Consume Component" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="SimpleConsumeComponent.aspx.cs" Inherits="BeginningASP.NET4._5.Components.SimpleConsumeComponent" %>


<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>Consume a component</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblConsumeSimpleComponent"></asp:Label>
    <br />
    <label for="txtInputInt">Enter an integer:</label>&nbsp;<asp:TextBox runat="server" ID="txtInputInt" CausesValidation="true"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtInputInt"
        id="valInputIntRqdFieldValidator" Display="Dynamic" Text="Integer field cannot be empty" ErrorMessage="Empty field" EnableClientScript="true"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator runat="server" Display="Dynamic" ControlToValidate="txtInputInt"
        ValidationExpression="\d+" Text="Please enter an integer" ErrorMessage="Incorrect data type"></asp:RegularExpressionValidator>
    <br />
    <asp:Button runat="server" ID="cmdGetInt" Text="Submit" OnClick="cmdGetInt_Click" CausesValidation="true" />
</asp:Content>

