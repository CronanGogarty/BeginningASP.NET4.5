<%@ Page Title="Database Interactions" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="DatabaseInteractions.aspx.cs" Inherits="BeginningASP.NET4._5.ADO.NET.DatabaseInteractions" %>
<asp:Content runat="server" ID="head" ContentPlaceHolderID="head">
    <style>
        [id*="Validator"] {
            float:right;
            padding-right:0.7em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>This page demonstrates some of the more common database interactions such as Update, Insert, Delete.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divDatabaseActions" class="divInput">
        <div class="divInput"><label for="selAuthorList">Select Author:</label>&nbsp;<asp:DropDownList OnSelectedIndexChanged="selAuthorList_SelectedIndexChanged" AutoPostBack="true" runat="server" ID="selAuthorList"></asp:DropDownList>&nbsp;
            <asp:Button runat="server" ID="cmdUpdate" OnClick="cmdUpdate_Click" Text="Update" />
            <br />
            <br />
            <asp:Button runat="server" ID="cmdDelete" OnClick="cmdDelete_Click" Text="Delete" /></div>
        <div class="divInput"><label for="cmdNew">Or:</label>&nbsp;
            <asp:Button runat="server" ID="cmdCreateNew" CausesValidation="false" OnClick="cmdCreateNew_Click" Text="Create New" />
            <%--<input type="button" onclick="clearForm();" value="Create New User (clear form)" />--%>
            <br />
            <br />
            <asp:Button runat="server" ID="cmdInsertNew" CausesValidation="false" OnClick="cmdInsertNew_Click" Text="Insert New" /></div>
    </div>
    <br />
    <div id="divDatabaseRecord" class="divInput">
        
        <div class="divInput"><label for="txtUniqueID">Unique ID:</label><asp:TextBox runat="server" ID="txtUniqueID" ></asp:TextBox>
            <asp:RequiredFieldValidator 
                runat="server" 
                ID="vldUniqueIDReqdFieldValidator" 
                ErrorMessage="Unique ID cannot be empty" 
                Text="Unique ID cannot be empty" 
                ControlToValidate="txtUniqueID"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator 
                runat="server" 
                ID="vldUniqueIDRegExpValidator" 
                ControlToValidate="txtUniqueID" 
                ErrorMessage="Required format: ###-##-####" Enabled="false"></asp:RegularExpressionValidator></div>
        <div class="divInput"><label for="txtFirstName">First Name:</label><asp:TextBox CausesValidation="false" runat="server" ID="txtFirstName" ></asp:TextBox></div>
        <div class="divInput"><label for="txtLastName">Last Name:</label><asp:TextBox runat="server" ID="txtLastName" ></asp:TextBox></div>
        <div class="divInput"><label for="txtPhone">Phone:</label><asp:TextBox runat="server" ID="txtPhone" TextMode="Phone"></asp:TextBox></div>
        <div class="divInput"><label for="txtAddress">Address:</label><asp:TextBox runat="server" ID="txtAddress"></asp:TextBox></div>
        <div class="divInput"><label for="txtCity">City:</label><asp:TextBox runat="server" ID="txtCity" ></asp:TextBox></div>
        <div class="divInput"><label for="txtState">State:</label><asp:TextBox runat="server" ID="txtState" ></asp:TextBox></div>
        <div class="divInput"><label for="txtZipCode">Zip Code:</label><asp:TextBox runat="server" ID="txtZipCode"></asp:TextBox></div>
        <div class="divInput"><label for="chkContract">Contract:</label><asp:CheckBox runat="server" ID="chkContract" Checked="true" /></div>
        <br />
        <br />
        <asp:Label runat="server" ID="lblResult" Visible="false"></asp:Label>
        <asp:Label runat="server" ID="lblError" Visible="false"></asp:Label>
    </div>

    <script>
        (function hello() {
            console.log("hello");
        })();

        function clearForm() {
            console.log("Clear form.....");
        }
    </script>
</asp:Content>
