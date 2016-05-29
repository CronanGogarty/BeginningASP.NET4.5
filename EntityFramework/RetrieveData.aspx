<%@ Page Title="Retrieve Data" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="RetrieveData.aspx.cs" Inherits="BeginningASP.NET4._5.EntityDataModels.RetrieveData" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>Retrieve data using Entity Data Model.<br /><br />
        An Entity Data Model was created to represent the Northwind database.<br />
        This allows us to create an object in code that represents the database and to access tables simply by using "EntityName.TableName.ToList()".<br /><br />
        In this instance we retrieve all the records in the Products table by using "entities.Products.ToList()" and by binding to the GridView. 
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView runat="server" ID="gridViewData">
    </asp:GridView>
    <br />
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</asp:Content>

