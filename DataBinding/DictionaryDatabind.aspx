<%@ Page Title="Dictionary Databind" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="DictionaryDatabind.aspx.cs" Inherits="BeginningASP.NET4._5.DataBinding.DictionaryDatabind" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
     <p>An example of how to databind a Dictionary object to a control.
         <br /><br />
         The Dictionary object is strongly typed, containing an int key and string value. The dictionary object is bound to a dropdown list. There is no further functionality on this page.
     </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <asp:DropDownList runat="server" ID="selNumberedFruit"></asp:DropDownList>
</asp:Content>
