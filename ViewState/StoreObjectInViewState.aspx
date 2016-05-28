<%@ Page Title="Store Object in ViewState" MasterPageFile="~/BasicTemplate.Master" Language="C#" AutoEventWireup="true" CodeBehind="StoreObjectInViewState.aspx.cs" Inherits="BeginningASP.NET4._5.ViewState.StoreObjectInViewState" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
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
</asp:Content>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>This is a more advanced demonstration of using ViewState to store data. In this example we create an object of type <a href="https://github.com/CronanGogarty/BeginningASP.NET4.5/blob/master/ViewState/SerializablePerson.cs" target="_blank">SerializablePerson</a> and store that in ViewState.
        <br /><br />
        Enter a first name and last name in the appropriate fields, select an age from the dropdown list and click on "Create Person". Once you have created a person and added the object to ViewState, you can retrieve that object by clicking on "Retrieve Person".
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
</asp:Content>