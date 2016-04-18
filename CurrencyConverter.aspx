<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrencyConverter.aspx.cs" Inherits="BeginningASP.NET4._5.CurrencyConverter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Convert:&nbsp;
            <input type="text" id="txtUSDollars" runat="server" />
            &nbsp;U.S. dollars to&nbsp;
            <select id="selCurrency" runat="server"></select>
            <br />
            <br />
            <input type="submit" value="OK" id="convertButton" runat="server" onServerClick="convertButton_ServerClick" />
            <p id="conversionResult" runat="server"></p>
        </div>
    </form>
</body>
</html>
