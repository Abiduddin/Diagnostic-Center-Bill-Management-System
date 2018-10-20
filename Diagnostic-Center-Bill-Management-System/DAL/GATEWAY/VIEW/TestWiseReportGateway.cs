using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL.VIEW_MODEL;

namespace Diagnostic_Center_Bill_Management_System.DAL.GATEWAY.VIEW
{
    public class TestWiseReportGateway:ParentGateway
    {
        public List<TestTypeRequestView> GetAllTestTypeRequest()
        {
            Query = "SELECT * FROM TestTypeRequestView";
            Command = new SqlCommand(Query,Connection);
            Connection.Open();

            Reader = Command.ExecuteReader();
            List<TestTypeRequestView> aTestTypeRequestViews = null;
            if (Reader.HasRows)
            {
                aTestTypeRequestViews = new List<TestTypeRequestView>();
                while (Reader.Read())
                {
                    TestTypeRequestView aTestTypeRequestView = new TestTypeRequestView();
                    aTestTypeRequestView.TestId = Convert.ToInt32(Reader["TestId"]);
                    aTestTypeRequestView.TypeId = Convert.ToInt32(Reader["TypeId"]);
                    aTestTypeRequestView.DueDate = Reader["DueDate"].ToString();
                    aTestTypeRequestView.Fee = Convert.ToInt32(Reader["Fee"]);
                    aTestTypeRequestViews.Add(aTestTypeRequestView);
                }
            }

            return aTestTypeRequestViews;
        }
    }
}