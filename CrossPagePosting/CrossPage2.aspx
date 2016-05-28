<%@ Page Title="CrossPagePosting - CrossPage2" MasterPageFile="~/BasicTemplate.Master" Language="C#" AutoEventWireup="true" CodeBehind="CrossPage2.aspx.cs" Inherits="BeginningASP.NET4._5.CrossPagePosting.CrossPage2" %>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>This is a simple example of transferring data between ASP.NET pages. On this page we use the PreviousPage property to access the public properties that were created on CrossPage1. 
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="lblPreviousPage" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblFirstName" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblLastName" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblAge" runat="server"></asp:Label>
        <br /><br />
        <a href="CrossPage1.aspx"><< Back from whence you came</a>
    </div>
    

    
    </asp:Content>
