<%@ Page Title="Disconnected Data Access" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="DisconnectedDataAccess.aspx.cs" Inherits="BeginningASP.NET4._5.ADO.NET.DisconnectedDataAccess" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>Now an example of using the DataSet class to access and manage data in a disconnected state.</p>
    <ol aria-label="Steps:">
            <li>Define ConnectionString in web.config - (can be accessed using System.Web.Configuration.WebConfigurationManager.ConnectionStrings collection)</li>
            <li>Declare and create a new SqlConnection object using the ConnectionString</li>
            <li>Define a CommandText string - determine the command string you wish to execute on the database</li>
            <li>Declare and create a new SqlCommand object - set the CommandText and Connection properties</li>
            <li>Declare and create a new SqlDataAdapter object - pass it the command object</li>
            <li>Declare and create a new DataSet object</li>
            <li>Execute the SqlDataAdapter.Fill() method - pass the DateSet object you wish to populate - supply a name for the DataTable that will be returned by executing the command</li>
            <li>Loop throught the filled DateSet's Rows collection - access the DataColumns by name within each DataRow object - i.e. <code>string lname = datarow["au_lname"]</code></li>

        </ol>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblResult">

    </asp:Label>
    <br />
    <asp:Label runat="server" ID="lblError">

    </asp:Label>
</asp:Content>

