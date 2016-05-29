<%@ Page Title="Cache Dependencies" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="CacheDependencies.aspx.cs" Inherits="BeginningASP.NET4._5.Caching.CacheDependencies" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <%--<h2>Cache Dependencies</h2>--%>
    <p>An example of caching with dependencies to avoid using out-of-date cached information.<br />
        Cache dependencies allow you to make a cached item dependent on another resource, so that when that resource changes, the cached item is removed automatically.
        <br /><br />
        In this instance, when the page loads, a CacheDependency object is created that refers to the file <a href="ProductList.xml" target="_blank">"ProductList.xml"</a>.
        <br />
        When you click on "Add to Cache" the XmlDocument is added to Cache["ProductList"].
        <br />
        Clicking on "Query Cache" will retrieve the XmlDocument from cache if it still exists. The contents of the XML file are output to the page.
        <br />
    </p>
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
    <br />
    <asp:Literal runat="server" ID="xmlOut"></asp:Literal>
</asp:Content>

