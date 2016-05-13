<%@ Page Title="" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="ViewFiles.aspx.cs" Inherits="BeginningASP.NET4._5.FilesAndStreams.ViewFiles" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>View and manipulate files in a directory.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListBox runat="server" ID="lstViewFiles" OnSelectedIndexChanged="lstViewFiles_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox>
    <br />
    <asp:Label runat="server" ID="lblFileDetails"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</asp:Content>
