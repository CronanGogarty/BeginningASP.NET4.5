<%@ Page Title="Display Update Progress Bar" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="UpdateProgress.aspx.cs" Inherits="BeginningASP.NET4._5.Ajax.UpdateProgress" %>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>An example of showing a progress bar while the server completes some action.<br /><br />
        The task completed here is extremely simlple, the server waits 10 seconds then updates the time.<br />
        It is possible to cancel the action by clicking "Cancel" - doing so will execute a JavaScript function which cancels the Ajax postback.
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="updatePanel1">
        <ContentTemplate>
            <asp:Label runat="server" ID="lblCurrentTime"></asp:Label>
            <br />
            <asp:Button runat="server" ID="cmdUpdate" Text="Contact Server" OnClick="cmdUpdate_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <asp:UpdateProgress runat="server" ID="updateProgress1">
        <ProgressTemplate>
            <p style="height:20px;">Contacting server...&nbsp;<img src="../Images/progress-bar.gif" alt="Progress Bar" width="217" height="20" /></p>
            <br />
            <input ID="cmdCancel" onclick ="AbortPostBack()" type ="button" value="Cancel" />
        </ProgressTemplate>
    </asp:UpdateProgress>

    <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_initializeRequest(InitializeRequest);
        function InitializeRequest(sender, args) {
            if (prm.get_isInAsyncPostBack()) {
                args.set_cancel(true);
            }
        }
        function AbortPostBack() {
            if (prm.get_isInAsyncPostBack()) {
                prm.abortPostBack();
            }
        }
    </script>

</asp:Content>

