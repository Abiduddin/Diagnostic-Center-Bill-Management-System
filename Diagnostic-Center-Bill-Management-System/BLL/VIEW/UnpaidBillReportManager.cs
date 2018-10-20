using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.GATEWAY.VIEW;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL.VIEW_MODEL;

namespace Diagnostic_Center_Bill_Management_System.BLL.VIEW
{
    public class UnpaidBillReportManager
    {
        UnpaidBillReportGateway aUnpaidBillReportGateway = new UnpaidBillReportGateway();
        public List<UnpaidBillView> GetAllUnpaidBill(string toDate, string fromDate)
        {
            List<UnpaidBillView> aUnpaidBillViews = aUnpaidBillReportGateway.GetAllUnpaidBill();
            List<UnpaidBillView> realUnpaidBillViews = new List<UnpaidBillView>();

            foreach (var UnpaidBillView in aUnpaidBillViews)
            {
                if ((string.Compare(UnpaidBillView.DueDate, toDate) <= 0) && (string.Compare(UnpaidBillView.DueDate, fromDate) >= 0))
                {
                    realUnpaidBillViews.Add(UnpaidBillView);
                }
            }

            return realUnpaidBillViews;

        }
    }
}