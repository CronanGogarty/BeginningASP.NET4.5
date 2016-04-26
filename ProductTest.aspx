<%@ Page Language="C#" MasterPageFile="~/BasicTemplate.Master" Title="Display Product Details" %>

<asp:Content runat="server" ID="header" ContentPlaceHolderID="header">
    <p>Note: At Page_Load create Product object, then run Product.GetHtml(); this immediately outputs HTML directly to the page.
        <br />
        This explains why the product details not wrapped within the Master Page.
    </p>
</asp:Content>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="ContentPlaceHolder1">
    <script runat="server">
    private void Page_Load(object sender, EventArgs e)
    {
        Product saleProduct = new Product("Kitchen Garbage", 49.99M, "Images/garbage.jpg");
        Response.Write(saleProduct.GetHtml());
    }
</script>
</asp:Content>