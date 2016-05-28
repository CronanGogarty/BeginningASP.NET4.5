<%@ Page Title="ADO.NET DataSet DataBinding" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="ADO.NETDataBinding.aspx.cs" Inherits="BeginningASP.NET4._5.DataBinding.ADO_NETDataBinding" %>


<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>An example of binding a DataSet object to a listbox control.
        <br /><br />
        The DataSet object is not populated using a SQL query, instead the DataSet is populated using hard-coded values in the codebehind file.
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p></p>
    <asp:ListBox runat="server" ID="lstBxDatabind"></asp:ListBox>
</asp:Content>
