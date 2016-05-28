<%@ Page Title="Table Linking" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="TableLinking.aspx.cs" Inherits="BeginningASP.NET4._5.ADO.NET.TableLinking" %>


<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>This example uses the DataRelation object to ap the relationships between the tables in the dataset
    <br />To create a DataRelation, you need to specify the linked fields from two tables, and you need to give your DataRelation a unique name.
    <br />The order of the linked fields is important. 
    <br />The first field is the parent, and the second field is the child.
    <br />One parent can have many children, but each child can have only one parent</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblResult"></asp:Label>
</asp:Content>
