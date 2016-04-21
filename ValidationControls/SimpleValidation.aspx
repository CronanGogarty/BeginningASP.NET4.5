<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SimpleValidation.aspx.cs" Inherits="BeginningASP.NET4._5.ValidationControls.SimpleValidation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Simple Validation Example</title>
    <link rel="stylesheet" href="../Styles/Styles.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="divInput"><label for="txtNumberRange">Enter a number between 1 and 10 (inclusive):</label>&nbsp;<asp:TextBox ID="txtNumberRange" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator 
                ID="valRequiredFieldValidator" 
                runat="server" 
                ErrorMessage="You must enter a value" 
                ControlToValidate="txtNumberRange" 
                ForeColor="Red" 
                EnableClientScript="true" Text="*"></asp:RequiredFieldValidator>
            <asp:RangeValidator 
                ID="valRangeValidator" 
                runat="server" 
                ControlToValidate="txtNumberRange" 
                MaximumValue="10" 
                MinimumValue="1" 
                Type="Integer" 
                ErrorMessage="The number is not within the defined range!" 
                ForeColor="Red" 
                EnableClientScript="true" Text="*"></asp:RangeValidator></div>
        <div class="divInput"><label for="txtValidWord">Enter the word "Valid":</label>&nbsp;<asp:TextBox ID="txtValidWord" runat="server"></asp:TextBox><asp:RequiredFieldValidator 
                ControlToValidate="txtValidWord" 
                runat="server" 
                ID="valTxtValidWordRequiredFieldValidator" 
                ErrorMessage="This field cannot be empty." 
                ForeColor="Red" 
                Display="Static" 
                EnableClientScript="true" Text="*"></asp:RequiredFieldValidator>
            <asp:CompareValidator 
                ID="valTxtValidWordCompareValidator" 
                ControlToValidate="txtValidWord" 
                runat="server" 
                ValueToCompare="Valid"
                ErrorMessage="You must enter the word 'Valid' exactly as shown" 
                ForeColor="Red" 
                Display="Static" 
                EnableClientScript="true" Text="*"></asp:CompareValidator></div>
        <div class="divInput"><asp:Button ID="cmdSubmit" runat="server" Text="Submit" OnClick="cmdSubmit_Click" CausesValidation="true" /></div>
        <asp:Label ID="lblResult" runat="server" Visible="false"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" HeaderText="The following errors were encountered:" />
    </div>
    </form>
</body>
</html>
