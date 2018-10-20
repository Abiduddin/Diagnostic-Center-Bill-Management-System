using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Diagnostic_Center_Bill_Management_System.DAL.MODEL.VIEW_MODEL
{
    public class UnpaidBillView
    {
        public int BillNo { get; set; }
        public string MobileNo { get; set; }
        public string Name { get; set; }
        public int TotalFee { get; set; }
        public string DueDate { get; set; }

    }
}