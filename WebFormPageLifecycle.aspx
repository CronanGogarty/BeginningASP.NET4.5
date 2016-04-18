<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormPageLifecycle.aspx.cs" Inherits="BeginningASP.NET4._5.WebFormPageLifecycle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #ListBox1 {
            width:300px;
            height:250px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h4>Page Lifecycle - AutoPostback Events</h4>
        <p>Each element in the page has AutoPostBack="true" - the ListBox at the bottom shows the sequence that events are called.</p>
        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="true" OnTextChanged="CtrlChanged"></asp:TextBox>
        <br />
        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CtrlChanged"  />
        <br />
        <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="true" OnCheckedChanged="CtrlChanged" />&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="true" OnCheckedChanged="CtrlChanged" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="List of Events"></asp:Label>
        <br />
        <asp:ListBox ID="ListBox1" runat="server" ></asp:ListBox>
    </div>
    </form>
</body>
</html>
