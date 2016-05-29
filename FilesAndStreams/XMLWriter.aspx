<%@ Page Title="Write an XML File" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="XMLWriter.aspx.cs" Inherits="BeginningASP.NET4._5.FilesAndStreams.XMLWriter" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>An example of writing an XML file to the system using a StringWriter object, then reading the same file using an XmlTextReader object.<br />
        The contents of the XML file are hard-coded in the codebehind file.
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button runat="server" ID="cmdWriteXML" Text="Write XML" OnClick="cmdWriteXML_Click" />
    <br />
    <asp:Button runat="server" ID="cmdReadXML" Text="Read XML" OnClick="cmdReadXML_Click" Visible="false" />
    <br />
    <asp:Label runat="server" ID="lblXMLOutput" ></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblResult"></asp:Label>
    <br />
    <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</asp:Content>
