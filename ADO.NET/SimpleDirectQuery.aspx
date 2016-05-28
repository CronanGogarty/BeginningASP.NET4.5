<%@ Page Title="Direct SQL Query" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="SimpleDirectQuery.aspx.cs" Inherits="BeginningASP.NET4._5.ADO.NET.SimpleDirectQuery" %>


<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>This page demonstrates a simple direct database connection. The ConnectionString is hard-coded in the aspx.cs file.
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Output the surrent status of the SqlConnection object.
        <br />
        <asp:Label runat="server" ID="lblResults"></asp:Label>
    </p>
</asp:Content>

