<%@ Page Title="Cache Dependencies" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="CacheDependencies.aspx.cs" Inherits="BeginningASP.NET4._5.Caching.CacheDependencies" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <h2>Cache Dependencies</h2>
    <p>The XML file is stored in cache until it is altered.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button runat="server" ID="cmdAddToCache" Text="Add to Cache" OnClick="cmdAddToCache_Click" />
    <br />
    <asp:Button runat="server" ID="cmdQueryCache" Text="Query Cache" OnClick="cmdQueryCache_Click" />
    <br />
    <asp:Button runat="server" ID="cmdAlterXMLFile" Text="Alter XML File" OnClick="cmdAlterXMLFile_Click" />
    <br />
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <br />
    <asp:Literal runat="server" ID="xmlOut"></asp:Literal>
</asp:Content>

