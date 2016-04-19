<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreObjectInViewState.aspx.cs" Inherits="BeginningASP.NET4._5.ViewState.StoreObjectInViewState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StoreObjectInViewState</title>
    <style>
        .inputDiv {
            width: 350px;
            padding:5px;
            margin:2px;
            background:rgba(233, 223, 34, 0.79);
            border:1px solid rgb(183, 177, 56);
            overflow:auto;
        }
        .inputDiv label {
            float:left;
        }
        .inputDiv input[type="text"],
        #selAge,
        #cmdCreatePerson,
        #cmdRetrievePerson  {
            float:right;
        }
        #lblResult {
            display:block;
            margin-top:20px;
            border:1px solid #000;
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
                <asp:Button ID="cmdCreatePerson" runat="server" OnClick="cmdCreatePerson_Click" Text="Create Person" />
            </div>
            <div class="inputDiv">
                <asp:Button ID="cmdRetrievePerson" runat="server" OnClick="cmdRetrievePerson_Click" Text="Retrieve Person" />
            </div>
            <hr />
            <asp:Label ID="lblResult" runat="server"></asp:Label>

        </div>
    </form>
</body>
</html>
