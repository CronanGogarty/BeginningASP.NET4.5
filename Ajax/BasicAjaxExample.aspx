<%@ Page Title="Basic Ajax Example" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="BasicAjaxExample.aspx.cs" Inherits="BeginningASP.NET4._5.Ajax.BasicAjaxExample" %>

<asp:Content ContentPlaceHolderID="header" ID="Content2" runat="server">
    <p>Using Ajax it is possible to update only a section of the page without having to do a postback.<br /><br />
        This example uses the UpdatePanel control. When you click on "Update Time" the time is updated without a postback occurring or any interruption to the animated gif above.
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <p><img src="../Images/giphy.gif" alt="Animation" width="500" height="500" /></p>
    

    <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>

    <asp:UpdatePanel runat="server" ID="rptPanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Label runat="server" ID="lblCurrentTime"></asp:Label>
            <br />
            <asp:Button runat="server" ID="cmdUpdateTime" Text="Update Time" OnClick="cmdUpdateTime_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
