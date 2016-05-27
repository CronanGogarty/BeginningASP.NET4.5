<%@ Page Title="Retrieve Data" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="RetrieveData.aspx.cs" Inherits="BeginningASP.NET4._5.EntityDataModels.RetrieveData" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <%--<h2>Retrieve data using Entity Data Model</h2>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView runat="server" ID="gridViewData">
    </asp:GridView>
    <br />
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</asp:Content>

