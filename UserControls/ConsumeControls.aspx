<%@ Page Title="Consuming User Controls" MasterPageFile="~/BasicTemplate.Master" Language="C#" AutoEventWireup="true" CodeBehind="ConsumeControls.aspx.cs" Inherits="BeginningASP.NET4._5.UserControls.ConsumeControls" %>

<%@ Register TagPrefix="cronan" TagName="Header" Src="~/Controls/Header.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .footer {
            outline: 1px solid rgba(255, 0, 0, 0.7);
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <cronan:Header runat="server" ID="ascxHeader" />
    <cronan:LinkMenu runat="server" ID="ascxLinkMenu" OnLinkClicked="LinkClicked"></cronan:LinkMenu>
    <br />
    <asp:Label ID="lblClick" runat="server" Text="Click a link above"></asp:Label>
    <div>
        <%--<h2>Consuming a User Control</h2>--%>
        <p>Below is a User Control that is registered through Web.config - the control simply takes today's date and adds 90 days.</p>
        <cronan:NinetyDays runat="server" ID="ascx90days"></cronan:NinetyDays>
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
