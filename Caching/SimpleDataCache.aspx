<%@ Page Title="Simple Data Caching" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="SimpleDataCache.aspx.cs" Inherits="BeginningASP.NET4._5.Caching.SimpleDataCache" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>Simple Data Caching</p>
    <p>An item is placed into cache and cached for 30 seconds - repost the page to see the caching in action.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblInfo"></asp:Label>
    <br />
    <asp:Button runat="server" ID="cmdPost" Text="PostBack" OnClick="cmdPost_Click" />
</asp:Content>

