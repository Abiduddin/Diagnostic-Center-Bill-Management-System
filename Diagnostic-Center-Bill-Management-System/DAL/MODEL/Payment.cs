using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Security.AccessControl;
using System.Web;

namespace Diagnostic_Center_Bill_Management_System.DAL.MODEL
{
    public class Payment
    {
        public int BillNo { get; set; }
        public int TotalFee { get; set; }
        public string DueDate { get; set; }
        public bool IsPaid { get; set; }

    }
}