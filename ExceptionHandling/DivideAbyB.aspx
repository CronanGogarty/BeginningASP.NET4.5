<%@ Page MasterPageFile="~/BasicTemplate.Master" Title="Divide by Zero Exception" Language="C#" AutoEventWireup="True" CodeBehind="DivideAbyB.aspx.cs" Inherits="BeginningASP.NET4._5.ExceptionHandling.DivideAbyB" %>



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
        #ContentPlaceHolder1_lblResult {
            background:#fff;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>An example of handling a DivideByZeroException exception.
        <br />
        Just enter 0 as the divisor and submit to see the exception handling in action. 
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