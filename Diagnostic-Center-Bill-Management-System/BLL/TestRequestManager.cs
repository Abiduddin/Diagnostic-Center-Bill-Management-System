using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Diagnostic_Center_Bill_Management_System.DAL.GATEWAY;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.BLL
{
    public class TestRequestManager
    {
        TestRequestGateway aTestRequestGateway = new TestRequestGateway();
        public void RequestAllTest(List<Test> aTests, int patientId, int billNo)
        {
            aTestRequestGateway.RequestAllTest(aTests,patientId,billNo);

        }


    }
}