<%@ Page Title="Product Info" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="productInfo.aspx.cs" Inherits="BeginningASP.NET4._5.productInfo" %>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <style>
        .divGitHubLinks a {
            text-decoration:line-through;
        }
    </style>
    <p>
        This page further demonstrates URL Mapping - a technique whereby we can map one URL to display the contents of an entirely differnt URL.
        <br /><br />
        In this example, instead of showing the productID in the QueryString, the URL is mapped to a neater format similar to that seen in ASP.NET MVC.
        <br />
        <br />
        <a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/MappingAndRouting/productInfo.aspx" target="_blank">View ASPX code on GitHub</a><br />
        <a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/MappingAndRouting/productInfo.aspx.cs" target="_blank">View ASPX.CS code on GitHub</a>

    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>The URL to enter is "~/product/{productID}".
        <br />
        This matches an entry in the RouteTable.Routes collection that routes the request to "~/productInfo.aspx".
        <br />
        The {productID} parameter is made available through the Page.RouteData.Values["productID"] member.
    </p>
    <p><asp:Label runat="server" ID="lblProductID"></asp:Label></p>

    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

    <script>
        $(function () {
            console.log("Jquery productinfo.aspx....");
            $(".divGitHubLinks a").click(function () {
                alert("Due to URL mapping, these links point to files that do not exist.\nSee lower in the page for links to the GitHub files.");
                return false;
            });
        });
    </script>
</asp:Content>
