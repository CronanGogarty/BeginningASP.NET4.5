<%@ Page MasterPageFile="~/BasicTemplate.Master" Title="Simple Greetings Card" Language="C#" AutoEventWireup="true" CodeBehind="SimpleGreetingCard.aspx.cs" Inherits="BeginningASP.NET4._5.SimpleGreetingCard" %>

<asp:Content ContentPlaceHolderID="head" runat="server" ID="head">
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
    <p>An example of using the PostBack to update content on the page.<br /><br />Choose a color and font from the appropriate dropdown lists, enter a numeric font-size value, choose a border style, check whether to use the default image or not, enter your greeting in the textbox and finally click "Update" to see your design.</p>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1" ID="Content">
    <div>
        <div id="optionsDiv">
            <label for="lstSelectBackground" id="lblSelBG">Choose card background color:</label>
            <asp:DropDownList ID="lstSelectBackground" runat="server">
            </asp:DropDownList>
            <label for="lstSelectFont" id="lblSelFont">Choose a font:</label>
            <asp:DropDownList ID="lstSelectFont" runat="server">
            </asp:DropDownList>
            <label id="lblFontSize" for="txtFontSize">Enter a numeric font size</label>
            <asp:TextBox ID="txtFontSize" runat="server"></asp:TextBox>
            <label for="optBorderStyle" id="lblBorderStyle">Choose border style:</label>
            <asp:RadioButtonList ID="optBorderStyle" runat="server">
            </asp:RadioButtonList>
            <asp:CheckBox ID="chkDefaultImg" runat="server" Checked="true" />
            <label for="chkDefaultImg" id="lblDefaultImg">Add default image:</label>
            <label for="txtGreetingCopy" id="lblGreetingCopy">Add the greeting copy:</label>
            <asp:TextBox ID="txtGreetingCopy" TextMode="MultiLine" runat="server"></asp:TextBox>
            <asp:Button ID="cmdUpdate" runat="server" Text="Update" OnClick="cmdUpdate_Click" />
        </div>

        <asp:Panel ID="pnlGreetingCard" runat="server">
            <asp:Label ID="lblCopyText" runat="server"></asp:Label>
            <asp:Image ID="imgGreetingCardImage" runat="server" />
        </asp:Panel>
    </div>
</asp:Content>
