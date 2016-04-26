<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidationGroups.aspx.cs" Inherits="BeginningASP.NET4._5.ValidationControls.ValidationGroups" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Validation Groups</title>
    <link rel="stylesheet" href="../Styles/Styles.css" />

    <style>
        .divInput {
            width: 750px;
            overflow:auto;
        }

            
            .divInput input,
            .divInput textarea,
            .divInput [id^="sel"],
            .divInput [id^="cmd"],
            .divInput input[type="submit"] {
                float: none;
                position:absolute;
                left:200px;

            }

            .divInput span[id^="vld"] {
                position:absolute;
                left:400px;
            }

            .divInput input[type="submit"] {
                position:relative;
            }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="divInput"><label id="lblFirstName">First Name:</label>&nbsp;<asp:TextBox runat="server" ID="txtFirstName"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="vldFirstNameRqdFieldValidator" ControlToValidate="txtFirstName" ErrorMessage="First name cannot be blank" ValidationGroup="vldUserDetailsValidationGroup"></asp:RequiredFieldValidator>
            <asp:CustomValidator runat="server" ID="vldFirstNameCustomValidator" ControlToValidate="txtFirstName" ErrorMessage="First Name must be 2 characters or more" OnServerValidate="vldFirstNameCustomValidator_ServerValidate" ClientValidationFunction="Function_ValidateFirstNameLength" ValidationGroup="vldUserDetailsValidationGroup"></asp:CustomValidator>
        </div>
        <div class="divInput"><label for="txtLastName">Last Name:</label>&nbsp;<asp:TextBox runat="server" ID="txtLastName"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="vldLastNameRqdFieldValidator" ControlToValidate="txtLastName" ErrorMessage="Last name cannot be blank"></asp:RequiredFieldValidator>
            <asp:CustomValidator runat="server" ID="vldLastNameCustomValidator" ControlToValidate="txtLastName" ErrorMessage="Last name must be 2 characters or more" OnServerValidate="vldLastNameCustomValidator_ServerValidate" ClientValidationFunction="Function_ValidateLastNameLength" ValidationGroup="vldUserDetailsValidationGroup"></asp:CustomValidator>
        </div>
        <div class="divInput"><asp:Button runat="server" ID="cmdValidateName" ValidationGroup="vldUserDetailsValidationGroup" OnClick="cmdValidateName_Click" Text="Validate User Name" /></div>
        <div class="divInput"><label for="txtEmail">Email address:</label>&nbsp;<asp:TextBox runat="server" ID="txtEmail" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="vldEmailRqdFieldValidator" ControlToValidate="txtEmail" ErrorMessage="Email cannot be blank" ValidationGroup="vldEmailValidationGroup"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="vldEmailRegExpValidator" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid email" ValidationGroup="vldEmailValidationGroup" ValidationExpression="\S+@\S+\.\S+"></asp:RegularExpressionValidator>
        </div>
        <div class="divInput">
            <asp:Button runat="server" ID="cmdValidateEmail" ValidationGroup="vldEmailValidationGroup" OnClick="cmdValidateEmail_Click" Text="Validate Email" />
        </div>
        <asp:Label runat="server" ID="lblOutput"></asp:Label>
    </div>
    </form>

    <script>
        function Function_ValidateFirstNameLength(objSource, objArgs) {
            var string = objArgs.Value;
            if (string.length < 2) {
                objArgs.IsValid = false;
            }
        }

        function Function_ValidateLastNameLength(objSource, objArgs) {
            var string = objArgs.Value;
            if (string.length < 2) {
                objArgs.IsValid = false;
            }
        }
    </script>
</body>
</html>
