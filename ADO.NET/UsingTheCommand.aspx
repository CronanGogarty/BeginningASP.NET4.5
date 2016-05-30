<%@ Page Title="Command Object" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="UsingTheCommand.aspx.cs" Inherits="BeginningASP.NET4._5.ADO.NET.UsingTheCommand" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>Using the SQLCommand object to execute a query.
        <br /><br />
        Create the SqlConnection object with the ConnectionString stored in WebConfigurationManager.
        <br />
        Create a new command object: cmd.Connection = SqlConnection object created in step 1.
        <br />
        Set cmd.CommandText = SQL query string.
        <br />
        Open the connection.
        <br />
        Create DataReader object and set it equal to results of cmd.ExecuteReader()
        <br />
        Loop through DataReader to read results row-by-row.
        <br />
        Close the connection.
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Below are the results of running the cmd.ExecuteReader method on a SQLCommand object.
        <br />CommandText = "select au_lname, au_fname, state from authors where dbo.authors.state = 'CA'";
        <br />
        While the connection is open, I read each record in the DataReader using "while (reader.Read())"
        <br />as each record is read I append it to the output string.
    </p>
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <asp:Label runat="server" ID="lblExceptionMesssage" Visible="false"></asp:Label>
</asp:Content>

