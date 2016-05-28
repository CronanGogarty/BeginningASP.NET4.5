<%@ Page Title="Store Product in SessionState" MasterPageFile="~/BasicTemplate.Master" Language="C#" AutoEventWireup="true" CodeBehind="CreateProduct.aspx.cs" Inherits="BeginningASP.NET4._5.SessionState.CreateProduct" %>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>This page stores an object of type <a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/SessionState/Product.cs" target="_blank">Product</a> in Session state. It also utilizes Application state to maintain a count of the number of products the application has created.<br /><br />
        Enter a name, description, numeric ID, numeric price and click "Create Product". The application will increment the counter recording how many products this application has ceated. The product you have created has been stored in Session state. To retrieve the product from Session state click "Retrieve Product From SessionState".
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="lblProductCounter" runat="server"></asp:Label>
        <div class="divInput">
            <label for="txtName">Name:</label>&nbsp;<asp:TextBox ID="txtName" runat="server"></asp:TextBox></div>
        <div class="divInput">
            <label for="txtDescription">Description:</label>&nbsp;<asp:TextBox TextMode="MultiLine" runat="server" ID="txtDescription"></asp:TextBox></div>
        <div class="divInput">
            <label for="txtID">ID:</label>&nbsp;<asp:TextBox TextMode="Number" runat="server" ID="txtID" min="1" step="1"></asp:TextBox></div>
        <div class="divInput">
            <label for="txtPice">Price: $</label>&nbsp;<asp:TextBox TextMode="Number" min="0.01" step="0.01" ID="txtPrice" runat="server"></asp:TextBox></div>
        <div class="divInput">
            <asp:Button ID="cmdSubmit" runat="server" Text="Create Product" OnClick="cmdSubmit_Click" /></div>
        <asp:Label ID="lblOutput" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblErrorOutput" Visible="false" runat="server"></asp:Label>
        <br />
        <%--        <asp:Button ID="cmdAddToSessionState" runat="server" Visible="false" Text="Add Product to SessionState" OnClick="cmdAddToSessionState_Click" />--%>
        <asp:Button ID="cmdRetreiveProductFromSessionState" runat="server" Visible="false" Text="Retreive Product From SessionState" OnClick="cmdRetreiveProductFromSessionState_Click" />
    </div>
</asp:Content>
