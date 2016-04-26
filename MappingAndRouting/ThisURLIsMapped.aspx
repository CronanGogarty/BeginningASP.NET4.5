<%@ Page Title="This URL is mapped" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="ThisURLIsMapped.aspx.cs" Inherits="BeginningASP.NET4._5.MappingAndRouting.ThisURLIsMapped" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>This copy is coming from ThisURLIsMapped.aspx.
        <br /><br />
        By defining a URL mapping in Web.config, any requests to ~/MappingAndRouting/MapThisURL.aspx (a file that does not exist) will cause a Server.Transfer to occur to the URL specified which is ~/MappingAndRouting/ThisURLIsMapped.aspx?product=car.
        <br /><br />
        Evidently this Server.Transfer causes an issue with the SiteMap navigation - an issue that I shall endevour to resolve. I have opened a bug in tfs.
        <br /><br />
        In the URL Map entry, the Server.Transfer requests this url ~/MappingAndRouting/ThisURLIsMapped.aspx?product=car therefore I can access the Request.QueryString["product"] parameter and output it thusly; product = <asp:Label runat="server" ID="lblProduct"></asp:Label>.
        <br /><br />
        <asp:HyperLink runat="server" ID="lnkPage" ></asp:HyperLink>
    </p>
    
</asp:Content>
