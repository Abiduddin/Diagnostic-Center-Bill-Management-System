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
    public class TestWiseReportManager
    {
        TestWiseReportGateway aTestWiseReportGateway = new TestWiseReportGateway();
        TestGateway aTestGateway = new TestGateway();


        public List<TestWiseReport> GetAllTestReports(string toDate, string fromDate)
        {
            List<TestWiseReport> aTestWiseReports = new List<TestWiseReport>();
            

            List<TestTypeRequestView> aTestTypeRequestViews = aTestWiseReportGateway.GetAllTestTypeRequest();
            List<Test> aTests = aTestGateway.GetAllTest();

            List<int> testOccurList = new List<int>();

            foreach (var testRequestView in aTestTypeRequestViews)
            {
                if ((string.Compare(testRequestView.DueDate,toDate)<=0) && (string.Compare(testRequestView.DueDate,fromDate)>=0))
                {
                    testOccurList.Add(testRequestView.TestId);
                }
            }

            foreach (var test in aTests)
            {
                
                TestWiseReport aTestWiseReport = new TestWiseReport();
                aTestWiseReport.TestName = test.Name;
                int totalTest = 0;

                for (int i = 0; i < testOccurList.Count; i++)
                {
                    if (test.Id == testOccurList[i])
                    {
                        totalTest++;
                    }
                }

                aTestWiseReport.TotalTest = totalTest;
                aTestWiseReport.TotalAmount = totalTest*test.Fee;
                

                aTestWiseReports.Add(aTestWiseReport);


            }
            

            return aTestWiseReports;
        }
    }
}