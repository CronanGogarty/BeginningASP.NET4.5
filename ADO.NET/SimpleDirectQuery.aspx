<%@ Page Title="Direct SQL Query" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="SimpleDirectQuery.aspx.cs" Inherits="BeginningASP.NET4._5.ADO.NET.SimpleDirectQuery" %>


<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>Simple direct database connection and SQL query.</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Output the surrent status of the SqlConnection object.
        <br />
        <asp:Label runat="server" ID="lblResults"></asp:Label>
    </p>
</asp:Content>

