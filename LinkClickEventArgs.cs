using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeginningASP.NET4._5
{
    public class LinkClickedEventArgs : EventArgs
    {
        public string Url { get; set; }
        public bool Cancel { get; set; }

        public LinkClickedEventArgs(string url)
        {
            Url = url;
        }
    }
}