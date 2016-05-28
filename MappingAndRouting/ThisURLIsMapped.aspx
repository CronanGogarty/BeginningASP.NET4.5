<%@ Page Title="This URL is mapped" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="ThisURLIsMapped.aspx.cs" Inherits="BeginningASP.NET4._5.MappingAndRouting.ThisURLIsMapped" %>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>
        This page demonstrates URL Mapping - a technique whereby we can map one URL to display the contents of an entirely differnt URL.
        <br /><br />
        By defining a URL mapping in Web.config, any requests to;
        <br />~/MappingAndRouting/MapThisURL.aspx (a file that does not exist)
        <br />will cause a Server.Transfer to occur to the URL specified which is;
        <br />~/MappingAndRouting/ThisURLIsMapped.aspx?product=car.
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        This copy is coming from;
        <br />~/MappingAndRouting/ThisURLIsMapped.aspx
        <br />even though the URL in the browser bar is;
        <br />~/MappingAndRouting/MapThisURL.aspx
        <br />
        <br />
        In the URL Map entry, the Server.Transfer requests this url;
        <br />~/MappingAndRouting/ThisURLIsMapped.aspx?product=car
        <br />therefore I can access the Request.QueryString["product"] parameter and output it thusly;
        <br />product = <asp:Label runat="server" ID="lblProduct"></asp:Label>.
<%--        <br />
        <br />
        <asp:HyperLink runat="server" ID="lnkPage"></asp:HyperLink>--%>
    </p>

</asp:Content>
