using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Text;

namespace BeginningASP.NET4._5
{
    public partial class SimpleGreetingCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //populate the Background color dropdown list
                lstSelectBackground.Items.Add("White");
                lstSelectBackground.Items.Add("Yellow");
                lstSelectBackground.Items.Add("LightBlue");
                lstSelectBackground.Items.Add("LawnGreen");
                lstSelectBackground.Items.Add("CornflowerBlue");

                //populate the font select dropdown list
                lstSelectFont.Items.Add("Times New Roman");
                lstSelectFont.Items.Add("Arial");
                lstSelectFont.Items.Add("Verdana");
                lstSelectFont.Items.Add("Tahoma");
                lstSelectFont.Items.Add("Comic Sans");

                //create a new ListItem object 
                ListItem myItem = new ListItem();
                //set the Text property of the ListItem object 
                //the Text property is what will be displayed to the user
                myItem.Text = BorderStyle.Solid.ToString();
                //set the Value property of the ListItem object
                myItem.Value = ((int)BorderStyle.Solid).ToString();
                //finally add the ListItem object to the RadioButtonList web control
                optBorderStyle.Items.Add(myItem);

                //repeat the process for the other BorderStyle 
                myItem = new ListItem();
                myItem.Text = BorderStyle.Double.ToString();
                myItem.Value = ((int)BorderStyle.Double).ToString();
                optBorderStyle.Items.Add(myItem);

                myItem = new ListItem();
                myItem.Text = BorderStyle.None.ToString();
                myItem.Value = ((int)BorderStyle.None).ToString();
                optBorderStyle.Items.Add(myItem);

                //now select the first item in the RadioButtonList web control
                optBorderStyle.SelectedIndex = 0;

                imgGreetingCardImage.ImageUrl = "images/defaultpic.png";
            }
        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            pnlGreetingCard.BackColor = Color.FromName(lstSelectBackground.SelectedItem.Text);
            lblCopyText.Font.Name = lstSelectFont.SelectedItem.Text;
            //if the font size has been entered in the textbox
            if ((txtFontSize.Text.Length > 0))
            {
                try
                {
                    if (Int32.Parse(txtFontSize.Text) > 0)
                    {
                        //set the font size of the greetings copy
                        lblCopyText.Font.Size = FontUnit.Point(Int32.Parse(txtFontSize.Text));
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.Print(ex.Message);
                    lblCopyText.Font.Size = FontUnit.Point(14);
                }
            }
            
            //set the greeting copy
            lblCopyText.Text = txtGreetingCopy.Text;

            //set the border style
            //first retrieve the borderstyle value that was set by the user
            //remember that BorderStyle is an enumeration so we can cast the value to an int
            int bordervalue = Int32.Parse(optBorderStyle.SelectedItem.Value);
            //then set the panel BorderStyle by casting the value of bordervalue to a BorderStyle enumeration value
            pnlGreetingCard.BorderStyle = (BorderStyle)bordervalue;

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