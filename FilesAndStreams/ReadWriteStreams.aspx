<%@ Page Title="Reading Streams" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="ReadWriteStreams.aspx.cs" Inherits="BeginningASP.NET4._5.FilesAndStreams.ReadWriteStreams" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <style>
        [id*="txtStreamReader"],
        [id*="txtStreamWriter"] {
            width:100%;
            height:150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>Reading Streams</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox runat="server" ID="txtStreamReader" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</asp:Content>

