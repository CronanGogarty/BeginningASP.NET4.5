<%@ Page MasterPageFile="~/BasicTemplate.Master" Title="Greetings Card" Language="C#" AutoEventWireup="true" CodeBehind="AjaxGreetingsCard.aspx.cs" Inherits="BeginningASP.NET4._5.AjaxGreetingsCard" %>

<asp:Content runat="server" ID="head" ContentPlaceHolderID="head">
    <style>
        #optionsDiv {
            width:45%;
            background:rgba(242, 224, 138, 0.79);
            outline: 1px solid rgba(242, 224, 138, 1.0);
            padding:10px;
            float:left;
        }
        #pnlGreetingCard {
            width:45%;
            float:right;
            text-align:center;

        }
        #lblCopyText,
        #imgGreetingCardImage {
            margin:auto;
            display:block;
            padding:10px;
        }
        footer {
            clear:both;
        }
        label,
        select,
        table,
        textarea
         {
            display:block;
        }
        #chkDefaultImg,
        #lblDefaultImg,
        input[type="radio"],
        label[for*="optBorderStyle_"] {
            display:inline;
        }
        #optionsDiv > label,
        #chkDefaultImg {
            margin-top:20px;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>Use the options below to generate a personalized greetings card.
        <br />
        This page uses <strong>AJAX</strong> features to update the greetings card immediately.
    </p>
</asp:Content>

<asp:Content runat="server" ID="content" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>
    
        <div id="optionsDiv">
            <label for="lstSelectBackground" id="lblSelBG">Choose card background color:</label>
            <asp:DropDownList ID="lstSelectBackground" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ControlChanged">
            </asp:DropDownList>
            <label for="lstSelectFont" id="lblSelFont">Choose a font:</label>
            <asp:DropDownList ID="lstSelectFont" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ControlChanged">
            </asp:DropDownList>
            <label id="lblFontSize" for="txtFontSize">Enter a numeric font size</label>
            <asp:TextBox ID="txtFontSize" runat="server" AutoPostBack="true" OnTextChanged="ControlChanged"></asp:TextBox>
            <label for="optBorderStyle" id="lblBorderStyle">Choose border style:</label>
            <asp:RadioButtonList ID="optBorderStyle" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ControlChanged">
            </asp:RadioButtonList>
            <asp:CheckBox ID="chkDefaultImg" Checked="true" runat="server" AutoPostBack="true" OnCheckedChanged="ControlChanged" />
            <label for="chkDefaultImg" id="lblDefaultImg">Add default image:</label>
            <label for="txtGreetingCopy" id="lblGreetingCopy">Add the greeting copy:</label>
            <asp:TextBox ID="txtGreetingCopy" TextMode="MultiLine" runat="server" AutoPostBack="true" OnTextChanged="ControlChanged"></asp:TextBox>
            <%--<asp:Button ID="cmdUpdate" runat="server" Text="Update" OnClick="cmdUpdate_Click" />--%>
        </div>

        <asp:UpdatePanel runat="server" ID="updatePanel1">
            <ContentTemplate>
                <asp:Panel ID="pnlGreetingCard" runat="server">
                    <asp:Label ID="lblCopyText" runat="server"></asp:Label>
                    <asp:Image ID="imgGreetingCardImage" runat="server" />
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lstSelectBackground" />
                <asp:AsyncPostBackTrigger ControlID="lstSelectFont" />
                <asp:AsyncPostBackTrigger ControlID="txtFontSize" />
                <asp:AsyncPostBackTrigger ControlID="optBorderStyle" />
                <asp:AsyncPostBackTrigger ControlID="chkDefaultImg" />
                <asp:AsyncPostBackTrigger ControlID="txtGreetingCopy" />

            </Triggers>
        </asp:UpdatePanel>

</asp:Content>

