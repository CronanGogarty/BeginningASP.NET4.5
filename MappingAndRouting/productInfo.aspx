<%@ Page Title="Product Info" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="productInfo.aspx.cs" Inherits="BeginningASP.NET4._5.productInfo" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>The URL to enter is "~/product/{productID}".
        <br />
        This matches an entry in the RouteTable.Routes collection that routes the request to "~/productInfo.aspx".
        <br />
        The {productID} parameter is made available through the Page.RouteData.Values["productID"] member.
    </p>
    <p>ProductInfo.aspx</p>
    <p><asp:Label runat="server" ID="lblProductID"></asp:Label></p>
</asp:Content>
