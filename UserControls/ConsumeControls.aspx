<%@ Page Title="Consuming User Controls" MasterPageFile="~/BasicTemplate.Master" Language="C#" AutoEventWireup="true" CodeBehind="ConsumeControls.aspx.cs" Inherits="BeginningASP.NET4._5.UserControls.ConsumeControls" %>

<%@ Register TagPrefix="cronan" TagName="Header" Src="~/Controls/Header.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .footer {
            outline: 1px solid rgba(255, 0, 0, 0.7);
        }
    </style>
</asp:Content>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>
        This page demonstrates consuming User controls.
    </p>
    <div class="headerULWrapper">
        <p>The following User controls were created and registered in Web.Config;</p>
        <ul>
            <li>Header
                <ul>
                    <li><a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/Controls/Header.ascx" target="_blank">Header.ascx</a></li>
                    <li><a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/Controls/Header.ascx.cs" target="_blank">Header.ascx.cs</a></li>
                </ul>
            </li>
            <li>LinkMenu
                <ul>
                    <li><a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/Controls/LinkMenu.ascx" target="_blank">LinkMenu.ascx</a></li>
                    <li><a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/Controls/LinkMenu.ascx.cs" target="_blank">LinkMenu.ascx.cs</a></li>
                </ul>

            </li>
            <li>NinetyDays
                <ul>
                    <li><a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/Controls/90days.ascx" target="_blank">90days.ascx</a></li>
                    <li><a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/Controls/90days.ascx.cs" target="_blank">90days.ascx.cs</a></li>
                </ul>
            </li>
            <li>Footer
                <ul>
                    <li><a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/Controls/Footer.ascx" target="_blank">Footer.ascx</a></li>
                    <li><a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/Controls/Footer.ascx.cs" target="_blank">Footer.ascx.cs</a></li>
                </ul>
        </ul>
    </div>
    <p>
        The header control simply outputs a h1 element and a p element to the page.
        <br />
        The LinkMenu control displays a list of links and uses a method to show on the page which link you clicked.
        <br />
        The 90days control simply takes today's date and adds 90 days.
        <br />
        The Footer control will display either the long or short date format based on what the user has selected.
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <cronan:Header runat="server" ID="ascxHeader" />
    <hr />
    <cronan:LinkMenu runat="server" ID="ascxLinkMenu" OnLinkClicked="LinkClicked"></cronan:LinkMenu>
    
    <asp:Label ID="lblClick" runat="server" Text="Click a link above"></asp:Label>
    <hr />
    <div>
        <%--<h2>Consuming a User Control</h2>--%>
        <p>Below is a User Control that is registered through Web.config - the control simply takes today's date and adds 90 days.</p>
        <cronan:NinetyDays runat="server" ID="ascx90days"></cronan:NinetyDays>
        <hr />
        <p>
            <asp:RadioButton ID="rdoLongDate" runat="server" Text="Long Date" Checked="true" GroupName="footerFormat" />
            <br />
            <asp:RadioButton ID="rdoShortTime" runat="server" Text="Short Time" GroupName="footerFormat" />
            <br />
            <asp:Button ID="cmdChangeFooterFormat" runat="server" Text="Update Footer Format" />
        </p>
    </div>

    <footer class="footer">
        <cronan:Footer runat="server" ID="ascxFooter" />
    </footer>
</asp:Content>
