<%@ Page MasterPageFile="~/BasicTemplate.Master" Title="Custom Exception Handlers" Language="C#" AutoEventWireup="true" CodeBehind="CustomExceptionHandlers.aspx.cs" Inherits="BeginningASP.NET4._5.ExceptionHandling.CustomExceptionHandlers" %>

<asp:Content runat="server" ID="head" ContentPlaceHolderID="head">
    <style>
        .divInput {
            width: 350px;
            padding:5px;
            margin:2px;
            background:rgba(233, 223, 34, 0.79);
            border:1px solid rgb(183, 177, 56);
        }
        .divInput label {
            float:left;
        }
        .divInput input[type="text"] {
            float:right;
        }
        #lblResult {
            display:block;
            margin-top:20px;
            border:1px solid #fff;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>This page demonstrates writing and handling custom exceptions.
        <br /><br />
        The custom exception is thrown when the user attmpts to divide by zero.
        <br />
        To see the custom exception in action simply enter 0 into the number B field then click "Divide A by B" - the custom error is thrown by the divideAbyB method, handled by a custom error handler and the output is displayed below.
        <br />Generic exceptions are also handled, to see a System.FormatException exception enter a string or empty value and click "Divide A by B".
    </p>
</asp:Content>

<asp:Content runat="server" ID="content" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
        <div class="divInput"><label for="txtInputA" id="lblInputA">Enter number A:</label>&nbsp;<asp:TextBox ID="txtInputA" runat="server"></asp:TextBox></div>
        <div class="divInput"><label for="txtInputB" id="lblInputB">Enter number B:</label>&nbsp;<asp:TextBox ID="txtInputB" runat="server"></asp:TextBox></div>
        <asp:Button ID="cmdDivideAbyB" runat="server" Text="Divide A by B" OnClick="cmdDivideAbyB_Click" />
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    </div>
</asp:Content>
