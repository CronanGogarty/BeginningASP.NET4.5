<%@ Page Title="Repeated-Value DataBinding" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Repeated-ValueDataBinding.aspx.cs" Inherits="BeginningASP.NET4._5.DataBinding.Repeated_ValueDataBinding" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article title="Repeated-Value DataBinding" id="artRptValDatabind">
        <section>
            <%--<h2>Repeated-Value DataBinding</h2>--%>
            <h3>Some controls databound to a strongly-typed List object</h3>
            <p>
                <asp:DropDownList runat="server" ID="selFruit"></asp:DropDownList> 
                &nbsp;<asp:ListBox runat="server" id="lstFruit"></asp:ListBox>&nbsp;
                <asp:CheckBoxList runat="server" ID="chkLst"></asp:CheckBoxList>&nbsp;
                <asp:BulletedList runat="server" ID="bulLst"></asp:BulletedList>&nbsp;
                <asp:RadioButtonList runat="server" ID="rdoLst"></asp:RadioButtonList>
            </p>
            <asp:Label runat="server" ID="lblRptValResult"></asp:Label>
            <br />
            <asp:Label runat="server" ID="lblRptVakErrormessage"></asp:Label>
        </section>
    </article>
</asp:Content>
