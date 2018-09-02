using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.GATEWAY;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.BLL
{
    public class TestManager
    {
        TestGateway aTestGateway = new TestGateway();
        public void SaveTest(Test aTest)
        {
            aTestGateway.SaveTest(aTest);
        }

        public List<Test> GetAllTest()
        {
            return aTestGateway.GetAllTest();
        }

        public Test GetTestById(int testId)
        {
            return aTestGateway.GetTestById(testId);
        }
    }
}