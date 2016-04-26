<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiView.aspx.cs" Inherits="BeginningASP.NET4._5.RichControls.MultiView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>Some Content here</p>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View runat="server" ID="view1"><label for="selForeground">Select foreground:</label>&nbsp;<asp:DropDownList runat="server" ID="selForeground"></asp:DropDownList><br /><p>Heyyyy</p></asp:View>
            <asp:View runat="server" ID="view2"><p>View 2</p><p>Heyyyy</p></asp:View>
            <asp:View runat="server" ID="view3"><p>View 3</p><p>Heyyyy</p></asp:View>
        </asp:MultiView>
        
    </div>
    </form>
</body>
</html>
