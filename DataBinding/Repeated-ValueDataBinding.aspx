<%@ Page Title="Repeated-Value DataBinding" Language="C#" MasterPageFile="~/BasicTemplate.Master" AutoEventWireup="true" CodeBehind="Repeated-ValueDataBinding.aspx.cs" Inherits="BeginningASP.NET4._5.DataBinding.Repeated_ValueDataBinding" %>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <p>This page simply displays a strongly-typed List<> object that is bound to a variety of different controls in the page. The controls perform no actions, this is simply an exercise in databinding.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article title="Repeated-Value DataBinding" id="artRptValDatabind">
        <section>
            <%--<h2>Repeated-Value DataBinding</h2>--%>
            <h3>Some controls databound to a strongly-typed List object</h3>
            <p>
                <asp:DropDownList runat="server" ID="selFruit"></asp:DropDownList><br /><br />
                <asp:ListBox runat="server" id="lstFruit"></asp:ListBox><br /><br />
                <asp:CheckBoxList runat="server" ID="chkLst"></asp:CheckBoxList><br /><br />
                <asp:BulletedList runat="server" ID="bulLst"></asp:BulletedList><br /><br />
                <asp:RadioButtonList runat="server" ID="rdoLst"></asp:RadioButtonList>
            </p>
            <asp:Label runat="server" ID="lblRptValResult"></asp:Label>
            <br />
            <asp:Label runat="server" ID="lblRptVakErrormessage"></asp:Label>
        </section>
    </article>
</asp:Content>
