using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL.VIEW_MODEL;

namespace Diagnostic_Center_Bill_Management_System.DAL.GATEWAY.VIEW
{
    public class UnpaidBillReportGateway:ParentGateway
    {
        public List<UnpaidBillView> GetAllUnpaidBill()
        {
            Query = "SELECT * FROM UnpaidBillView";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();

            Reader = Command.ExecuteReader();
            List<UnpaidBillView> aUnpaidBillViews = null;
            if (Reader.HasRows)
            {
                aUnpaidBillViews = new List<UnpaidBillView>();
                while (Reader.Read())
                {
                    UnpaidBillView aUnpaidBillView = new UnpaidBillView();
                    aUnpaidBillView.BillNo = Convert.ToInt32(Reader["BillNo"]);
                    aUnpaidBillView.MobileNo = Reader["MobileNo"].ToString();
                    aUnpaidBillView.Name = Reader["Name"].ToString();
                    aUnpaidBillView.TotalFee = Convert.ToInt32(Reader["TotalFee"]);
                    aUnpaidBillView.DueDate = Reader["DueDate"].ToString();
                    aUnpaidBillViews.Add(aUnpaidBillView);
                }
            }

            return aUnpaidBillViews;

        }
    }
}