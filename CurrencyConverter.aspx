<%@ Page MasterPageFile="~/BasicTemplate.Master" Title="Currency Converter" Language="C#" AutoEventWireup="true" CodeBehind="CurrencyConverter.aspx.cs" Inherits="BeginningASP.NET4._5.CurrencyConverter" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="ContentPlaceHolder1">
    <p>A simple currency converter example using hard-coded currency conversion arithmetic.</p>
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
</asp:Content>
