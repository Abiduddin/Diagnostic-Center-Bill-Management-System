using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Diagnostic_Center_Bill_Management_System.DAL.MODEL
{
    public class TestRequest
    {
        public int Id { get; set; }
        public int TestId { get; set; }
        public int PatientId { get; set; }
        public int BillNo { get; set; }


    }
}