<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="DivideAbyB.aspx.cs" Inherits="BeginningASP.NET4._5.ExceptionHandling.DivideAbyB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DivideByZeroException</title>

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

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="divInput"><label for="txtInputA" id="lblInputA">Enter number A:</label>&nbsp;<asp:TextBox ID="txtInputA" runat="server"></asp:TextBox></div>
        <div class="divInput"><label for="txtInputB" id="lblInputB">Enter number B:</label>&nbsp;<asp:TextBox ID="txtInputB" runat="server"></asp:TextBox></div>
        <asp:Button ID="cmdDivideAbyB" runat="server" Text="Divide A by B" OnClick="cmdDivideAbyB_Click" />

        <asp:Label ID="lblResult" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
