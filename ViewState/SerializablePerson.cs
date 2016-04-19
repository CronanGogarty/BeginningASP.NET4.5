using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeginningASP.NET4._5.ViewState
{
    ///<note>
    ///to store an item in view state, ASP.NET must be able to convert it into a stream of bytes 
    ///so that it can be added to the hidden input field in the page. This process is called serialization.
    ///</note>
    
    [Serializable]
    public class SerializablePerson
    {
        //private string firstName;
        //private string lastName;
        //private int age;

        public string Firstname { get; set; }
        public string LastName { get; set; }
        public int Age { get; set; }

        public SerializablePerson(string firstName, string lastName, int age)
        {
            Firstname = firstName;
            LastName = lastName;
            Age = age;
        }
    }
}