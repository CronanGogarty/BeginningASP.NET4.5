<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LinkMenu.ascx.cs" Inherits="BeginningASP.NET4._5.Controls.LinkMenu" %>

<navigation>
    <%--<ul>
        <li><a href="../Default.aspx">Home</a></li>
        <li><a href="../CurrencyConverter.aspx">Currency Converter</a></li>
        <li><a href="../ProductTest.aspx">Show a Product</a></li>
        <li><a href="../SimpleGreetingCard.aspx">Simple Greeting Card</a></li>
        <li><a href="../GreetingsCard.aspx">Greetings Card</a></li>
    </ul>--%>
    <ul>
        <li><asp:LinkButton ID="lnkLlink1" runat="server" CommandArgument="Home" OnCommand="link_Click" >Home</asp:LinkButton></li>
        <li><asp:LinkButton ID="lnkLlink2" runat="server" CommandArgument="Currency Converter" OnCommand="link_Click" >Currency Converter</asp:LinkButton></li>
        <li><asp:LinkButton ID="lnkLlink3" runat="server" CommandArgument="View Product" OnCommand="link_Click" >View Product</asp:LinkButton></li>

    </ul>
</navigation>

