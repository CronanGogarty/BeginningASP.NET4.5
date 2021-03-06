﻿<%@ Page Title="CrossPagePosting - CrossPage1" MasterPageFile="~/BasicTemplate.Master" Language="C#" AutoEventWireup="true" CodeBehind="CrossPage1.aspx.cs" Inherits="BeginningASP.NET4._5.CrossPagePosting.CrossPage1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>This is a simple example of transferring data between ASP.NET pages. On this page we create public properties that can be accessed by other pages. 
        <br /><br />
        Enter a first name and last name in the appropriate fields, select an age from the dropdown list and click on "Post To CrossPage2".
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
                <asp:Button ID="cmdCrossPagePost" runat="server" PostBackUrl="~/CrossPagePosting/CrossPage2.aspx" Text="Post To CrossPage2" />
            </div>
        </div>

    </asp:Content>