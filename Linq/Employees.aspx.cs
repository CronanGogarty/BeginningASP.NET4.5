using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BeginningASP.NET4._5.Linq
{
    public partial class Employees : System.Web.UI.Page
    {

        List<Employee> employees;

        protected void Page_Load(object sender, EventArgs e)
        {
            employees = new List<Employee>();

            employees.Add(new Employee(123, "Paul", "Thompson", "Mr"));
            employees.Add(new Employee(456, "John", "Self", "Mr"));
            employees.Add(new Employee(789, "Angela", "Schwarz", "Frau"));
            employees.Add(new Employee(321, "Josef", "Schultz", "Dr"));

        }

        protected void cmdGetMatches_Click(object sender, EventArgs e)
        {
            //from alias in collection
            //set the where clause (optional)
            //specify the data you wish to retrieve (in this instance the employee object)
            var matches = from employee in employees
                          where employee.Title.Equals("Mr")
                          select employee;

            gridMatches.DataSource = matches;
            gridMatches.DataBind();
        }

        protected void cmdAnonymousTypes_Click(object sender, EventArgs e)
        {
            var matches = from alias in employees
                          where alias.Title.Equals("Mr")
                          //using anonymous types, we can declare a new class to hold the data we wish to retrieve
                          select new { FirstName = alias.FirstName, LastName = alias.LastName, Title = alias.Title };
            //The ability to transform the data you’re querying into results with a different structure is called projection.

            gridMatches.DataSource = matches;
            gridMatches.DataBind();

        }

        protected void cmdRetrieveDefinedType_Click(object sender, EventArgs e)
        {
            var matches = from nonsensicalAliasName in employees
                          where nonsensicalAliasName.Title.Equals("Mr")
                          //select new EmployeeName { FirstName = nonsensicalAliasName.FirstName, LastName = nonsensicalAliasName.LastName};
                          select new EmployeeName(nonsensicalAliasName.FirstName, nonsensicalAliasName.LastName);

            gridMatches.DataSource = matches;
            gridMatches.DataBind();
        }

        protected void cmdFilterByMethod_Click(object sender, EventArgs e)
        {
            IEnumerable<Employee> matches = from employee in employees
                                            where FilterEmployees(employee) //filter using the FilterEmployees method
                                            select employee;

            gridMatches.DataSource = matches;
            gridMatches.DataBind();
        }

        private bool FilterEmployees(Employee employee)
        {
            return employee.Title.Equals("Mr");
        }

        protected void cmdReturnAllEmployees_Click(object sender, EventArgs e)
        {
            var matches = from employee in employees
                          orderby employee.FirstName, employee.LastName
                          select employee;

            gridMatches.DataSource = matches;
            gridMatches.DataBind();
        }

    }

    public class EmployeeName
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public EmployeeName(string firstName, string lastName)
        {
            FirstName = firstName;
            LastName = lastName;
        }
    }
}