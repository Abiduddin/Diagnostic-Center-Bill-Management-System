using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Diagnostic_Center_Bill_Management_System.DAL.MODEL.VIEW_MODEL
{
    public class TestTypeRequestView
    {
        public int TestId { get; set; }
        public int  TypeId { get; set; }
        public string DueDate { get; set; }

        public int Fee { get; set; }


    }
}