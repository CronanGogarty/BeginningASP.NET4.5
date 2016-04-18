using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Text;
using System.ComponentModel;

namespace BeginningASP.NET4._5
{
    public partial class GreetingsCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //populate the Background color dropdown list
                //.NET provides a long list of color names in the System.Drawing.KnownColor enumeration
                //the static Enum.GetNames() method, inspects an enumeration and provides an array of strings, with one string for each value in the enumeration.
                string[] colorArray = Enum.GetNames(typeof(KnownColor));
                lstSelectBackground.DataSource = colorArray;
                lstSelectBackground.DataBind();

                //populate the font select dropdown list
                InstalledFontCollection fonts = new InstalledFontCollection();
                foreach (FontFamily fontfamily in fonts.Families)
                {
                    lstSelectFont.Items.Add(fontfamily.Name);
                }

                //populate the border style RadioButtonList
                string[] borderStyleArray = Enum.GetNames(typeof(BorderStyle));
                optBorderStyle.DataSource = borderStyleArray;
                optBorderStyle.DataBind();

                //now select the first item in the RadioButtonList web control
                optBorderStyle.SelectedIndex = 0;

                imgGreetingCardImage.ImageUrl = "images/defaultpic.png";
                chkDefaultImg.Checked = true;
                txtFontSize.Text = "24";
                txtGreetingCopy.Text = "Enter the greeting message you wish to appear on your e-card in this box.";
            }
        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            RenderCard();
        }

        protected void ControlChanged(object sender, EventArgs e)
        {
            RenderCard();
        }

        private void RenderCard()
        {
            pnlGreetingCard.BackColor = Color.FromName(lstSelectBackground.SelectedItem.Text);
            lblCopyText.Font.Name = lstSelectFont.SelectedItem.Text;
            //if the font size has been entered in the textbox
            if (txtFontSize.Text.Length > 0) {
                if (Int32.Parse(txtFontSize.Text) > 0)
                {
                    //set the font size of the greetings copy
                    lblCopyText.Font.Size = FontUnit.Point(Int32.Parse(txtFontSize.Text));
                }
            }
            else
            {
                lblCopyText.Font.Size = FontUnit.Point(12);
            }
            //set the greeting copy
            lblCopyText.Text = txtGreetingCopy.Text;

            //set the border style
            /*This code gets the appropriate TypeConverter (in this case, one that’s designed expressly to work with
            the BorderStyle enumeration). It then converts the text name (such as Solid) to the appropriate value
            (BorderStyle.Solid).*/
            // Find the appropriate TypeConverter for the BorderStyle enumeration.
            TypeConverter converter = TypeDescriptor.GetConverter(typeof(BorderStyle));
            // Update the border style using the value from the converter.
            pnlGreetingCard.BorderStyle = (BorderStyle)converter.ConvertFromString(optBorderStyle.SelectedItem.Value);

            //choose to display or hide the default image
            if (chkDefaultImg.Checked)
            {
                imgGreetingCardImage.Visible = true;
            }
            else
            {
                imgGreetingCardImage.Visible = false;
            }
        }
    }
}