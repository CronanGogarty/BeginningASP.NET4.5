<%@ Page Title="Create Product" MasterPageFile="~/BasicTemplate.Master" Language="C#" AutoEventWireup="true" CodeBehind="CreateProduct.aspx.cs" Inherits="BeginningASP.NET4._5.SessionState.CreateProduct" %>

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
        <%--        <asp:Button ID="cmdAddToSessionState" runat="server" Visible="false" Text="Add Product to SessionState" OnClick="cmdAddToSessionState_Click" />--%>
        <asp:Button ID="cmdRetreiveProductFromSessionState" runat="server" Visible="false" Text="Retreive Product From SessionState" OnClick="cmdRetreiveProductFromSessionState_Click" />
    </div>
</asp:Content>
