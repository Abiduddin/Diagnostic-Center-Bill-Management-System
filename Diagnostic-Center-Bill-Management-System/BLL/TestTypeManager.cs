using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.GATEWAY;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.BLL
{
    public class TestTypeManager
    {
        TestTypeGateway aTestTypeGateway = new TestTypeGateway();
        public void SaveTestType(TestType aTestType)
        {
            aTestTypeGateway.SaveTestType(aTestType);
        }

        public List<TestType> GetAllTestTypes()
        {
            return aTestTypeGateway.GetAllTestTypes();
        }

        public bool IsUniqeTestTypeName(string name)
        {
            return aTestTypeGateway.IsUniqeTestTypeName(name);

/*            if (rowAffected <= 0)
            {
                return true;
            }
            else
            {
                return false;
            }*/
        }
    }
}