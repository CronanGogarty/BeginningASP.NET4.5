<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrossPage1.aspx.cs" Inherits="BeginningASP.NET4._5.CrossPagePosting.CrossPage1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CrossPagePosting - CrossPage1</title>
    <style>
        .inputDiv {
            width: 350px;
            padding: 5px;
            margin: 2px;
            background: rgba(233, 223, 34, 0.79);
            border: 1px solid rgb(183, 177, 56);
            overflow: auto;
        }

            .inputDiv label {
                float: left;
            }

            .inputDiv input[type="text"],
            #selAge,
            #cmdCrossPagePost {
                float: right;
            }

        #lblResult {
            display: block;
            margin-top: 20px;
            border: 1px solid #000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="inputDiv">
                <label for="txtFirstName">FirstName:</label>&nbsp;<asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            </div>
            <div class="inputDiv">
                <label for="txtLastName">LastName:</label>&nbsp;<asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            </div>
            <div class="inputDiv">
                <label for="selAge">Age:</label>&nbsp;<asp:DropDownList ID="selAge" runat="server"></asp:DropDownList>
            </div>
            <div class="inputDiv">
                <asp:Button ID="cmdCrossPagePost" runat="server" PostBackUrl="~/CrossPagePosting/CrossPage2.aspx" Text="Post To CrossPage2" />
            </div>
        </div>
    </form>
</body>
</html>
