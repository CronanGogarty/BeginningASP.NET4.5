<%@ Page Title="Simple ViewState Example" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="SimpleViewStateExample.aspx.cs" Inherits="BeginningASP.NET4._5.ViewState.SimpleViewStateExample" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Button ID="cmdIncreaseStateCounter" runat="server" Text="Increase State Counter" OnClick="cmdIncreaseStateCounter_Click" />
        <br />
        <asp:Label ID="lblStateCounter" runat="server"></asp:Label>
        <hr />
        <label for="txtCopyToStore" id="lblCopyToStore">Enter some copy to be stored in ViewState:</label>
        <br />
        <asp:TextBox ID="txtCopyToStore" TextMode="MultiLine" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="cmdStoreCopy" runat="server" OnClick="cmdStoreCopy_Click" Text="Store Copy" />&nbsp;
        <asp:Button ID="cmdLoadStoredCopy" runat="server" OnClick="cmdLoadStoredCopy_Click" Text="Load Stored Copy" />
    </div>
</asp:Content>