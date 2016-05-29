<%@ Page Title="Entity Model Relationships" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Relationships.aspx.cs" Inherits="BeginningASP.NET4._5.EntityDataModels.Relationships" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>Entity Model Relationships.<br /><br />
        Because there is a relationship in the database between Customers and Orders tables, the Entity Data Model reflects this relationship.<br />
        It is possible to loop through all the customers in the Customers table and include the Orders relationship using "entities.Customers.Include("Orders")", then it is easy to retrieve the orders for each customer using "customer.Orders".
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblOutput"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</asp:Content>

