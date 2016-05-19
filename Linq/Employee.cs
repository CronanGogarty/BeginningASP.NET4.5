using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeginningASP.NET4._5.Linq
{
    public class Employee
    {
        public int EmployeeID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Title { get; set; }

        public Employee(int id, string fname, string lname, string title)
        {
            EmployeeID = id;
            FirstName = fname;
            LastName = lname;
            Title = title;
        }
    }
}