using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Diagnostic_Center_Bill_Management_System.DAL.MODEL.VIEW_MODEL
{
    public class TypeWiseReport
    {
        public string TestTypeName { get; set; }
        public int TotalTestType { get; set; }
        public int TotalAmount { get; set; }
    }
}