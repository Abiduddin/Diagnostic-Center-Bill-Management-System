using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.GATEWAY;
using Diagnostic_Center_Bill_Management_System.DAL.GATEWAY.VIEW;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL.VIEW_MODEL;

namespace Diagnostic_Center_Bill_Management_System.BLL.VIEW
{
    public class TypeWiseReportManager
    {
        TypeWiseReportGateway aTypeWiseReportGateway = new TypeWiseReportGateway();
        TestWiseReportGateway aTestWiseReportGateway  = new TestWiseReportGateway();
        TestTypeGateway aTestTypeGateway = new TestTypeGateway();

        public List<TypeWiseReport> GetAllTestTypeReports(string toDate, string fromDate)
        {
            
    List<TypeWiseReport> aTypeWiseReports = new List<TypeWiseReport>();
            

            List<TestTypeRequestView> aTestTypeRequestViews = aTestWiseReportGateway.GetAllTestTypeRequest();
            List<TestType> aTestTypes = aTestTypeGateway.GetAllTestTypes();

            List<int> testOccurList = new List<int>();
            List<int> testMoneyList = new List<int>();

            foreach (var testTypeRequestView in aTestTypeRequestViews)
            {
                if ((string.Compare(testTypeRequestView.DueDate,toDate)<=0) && (string.Compare(testTypeRequestView.DueDate,fromDate)>=0))
                {
                    testOccurList.Add(testTypeRequestView.TypeId);
                    testMoneyList.Add(testTypeRequestView.Fee);
                }
            }

            foreach (var type in aTestTypes)
            {
                
                TypeWiseReport aTypeWiseReport = new TypeWiseReport();
                
                aTypeWiseReport.TestTypeName = type.Name;
                int totalType = 0;
                int totalMoney = 0;

                for (int i = 0; i < testOccurList.Count; i++)
                {
                    if (type.Id == testOccurList[i])
                    {
                        totalType++;
                        totalMoney += testMoneyList[i];
                    }
                }

                aTypeWiseReport.TotalTestType = totalType;
                aTypeWiseReport.TotalAmount = totalMoney;
                

                aTypeWiseReports.Add(aTypeWiseReport);


            }
            

            return aTypeWiseReports;
        }
    }
}