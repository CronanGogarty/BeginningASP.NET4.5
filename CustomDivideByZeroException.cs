using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeginningASP.NET4._5
{
    public class CustomDivideByZeroException : DivideByZeroException 
    {
        //a CustomException must define 3 constructors as below
        /*
        These constructors don’t actually need to contain any code. All these constructors need to do is forward the
        parameters to the base class (the constructors in the inherited Exception class) by using the base
        keyword, as shown here: 
        */
        public CustomDivideByZeroException()
        {
        }

        public CustomDivideByZeroException(string message) : base(message)
        {
        }

        public CustomDivideByZeroException(string message, Exception inner) : base(message, inner)
        {
        }

        //define a custom parameter to specify the number to be divided
        private decimal number;
        public decimal Number
        {
            get { return number;}
            set {number = value;}
        }

    }
}