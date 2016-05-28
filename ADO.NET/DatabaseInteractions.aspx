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
    <p>This page demonstrates some of the more common database interactions such as Update, Insert, Delete.<br /><br />
        To see the details of an author in the database, select author name from the dropdown list, you can edit the details in the gridview and then click "Update" to commit the changes to the database.<br /><br />
        To create a new user fill in the required fields and click "Insert New".<br /><br />
        To delete an author, click the "Delete" button.<br /><br />
        <strong>NOTE:</strong> you will have to <a href="DatabaseInteractions.aspx">refresh the page</a> to see the changes reflected in the dropdown list.
    </p>
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
            <asp:Button runat="server" ID="cmdInsertNew" OnClick="cmdInsertNew_Click" Text="Insert New" /></div>
    </div>
    <br />
    <div id="divDatabaseRecord" class="divInput">
        
        <div class="divInput"><label for="txtUniqueID">Unique ID:</label><asp:TextBox runat="server" ID="txtUniqueID" ></asp:TextBox>
            <asp:RequiredFieldValidator 
                runat="server" 
                ID="vldUniqueIDReqdFieldValidator" 
                ErrorMessage="Unique ID cannot be empty" 
                Text="Unique ID cannot be empty" 
                ControlToValidate="txtUniqueID" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator  Display="Dynamic"
                runat="server" 
                ID="vldUniqueIDRegExpValidator" 
                ControlToValidate="txtUniqueID" 
                ErrorMessage="Required format: ###-##-####" ValidationExpression="^\d{3}-\d{2}-\d{4}"></asp:RegularExpressionValidator></div>
        <div class="divInput"><label for="txtFirstName">First Name:</label><asp:TextBox CausesValidation="false" runat="server" ID="txtFirstName" ></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" 
                ID="vldFirstNameRqdFieldValidator" 
                ControlToValidate="txtFirstName" 
                ErrorMessage="First Name cannot be blank" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="divInput"><label for="txtLastName">Last Name:</label><asp:TextBox runat="server" ID="txtLastName" ></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" 
                ID="vldLastNameRqdFieldValidator" 
                ControlToValidate="txtLastName" 
                ErrorMessage="Last Name cannot be blank" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="divInput"><label for="txtPhone">Phone:</label><asp:TextBox runat="server" ID="txtPhone" TextMode="Phone"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" 
                ID="vldPhoneRqdFieldValidator" 
                ControlToValidate="txtPhone" 
                ErrorMessage="Phone cannot be blank" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator 
                runat="server" 
                ID="vldPhoneRegExpValidator" 
                ErrorMessage="Phone must be in this format {###-###-####}" 
                ValidationExpression="^[2-9]\d{2}-\d{3}-\d{4}$" 
                ControlToValidate="txtPhone" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>
        <div class="divInput"><label for="txtAddress">Address:</label><asp:TextBox runat="server" ID="txtAddress"></asp:TextBox></div>
        <div class="divInput"><label for="txtCity">City:</label><asp:TextBox runat="server" ID="txtCity" ></asp:TextBox></div>
        <div class="divInput"><label for="txtState">State:</label><asp:TextBox runat="server" ID="txtState" MaxLength="2"></asp:TextBox></div>
        <div class="divInput"><label for="txtZipCode">Zip Code:</label><asp:TextBox runat="server" ID="txtZipCode" MaxLength="5"></asp:TextBox>
            <asp:RegularExpressionValidator runat="server" 
                ID="vldZipRegExpValidator" 
                ErrorMessage="Zip must be in this format {#####}" 
                ControlToValidate="txtZipCode" ValidationExpression="^\d{5}" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>
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
