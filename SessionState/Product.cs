using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeginningASP.NET4._5.SessionState
{
    public class Product
    {
        private string name;
        private int id;
        private string description;
        private decimal price;

        public string Name 
        { 
            get { return name;}
            set { name = value; } 
        }
        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        public decimal Price
        {
            get { return price; }
            set { price = value; }
        }
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        public Product(string name, string description, int id, decimal price)
        {
            Name = name;
            Description = description;
            ID = id;
            Price = price;
        }
    }
}