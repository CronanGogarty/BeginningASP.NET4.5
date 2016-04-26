using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.RichControls
{
    public partial class DateControl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MyCalendar_DayRender(Object source, DayRenderEventArgs e)
        {
            // Restrict dates after the year 2013 and those on the weekend.
            if (e.Day.IsWeekend || e.Day.Date.Year > 2016)
            {
                e.Day.IsSelectable = false;
            }

            // Check for May 5 in any year, and format it.
            if (e.Day.Date.Day == 5 && e.Day.Date.Month == 5)
            {
                e.Cell.BackColor = System.Drawing.Color.Yellow;
                // Add some static text to the cell.
                Label lbl = new Label();
                lbl.Text = "<br />My Birthday!";
                e.Cell.Controls.Add(lbl);
            }
        }

        protected void MyCalendar_SelectionChanged(object sender, EventArgs e)
        {

        }
    }
}