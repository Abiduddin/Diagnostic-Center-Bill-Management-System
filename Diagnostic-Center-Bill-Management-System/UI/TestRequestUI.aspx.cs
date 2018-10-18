using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Diagnostic_Center_Bill_Management_System.BLL;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.UI
{
    public partial class TestRequestUI : System.Web.UI.Page
    {
        TestManager aTestManager = new TestManager();
        PatientManager aPatientManager = new PatientManager();        
        TestRequestManager aTestRequestManager = new TestRequestManager();
        PaymentManager aPaymentManager = new PaymentManager();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                List<Test> tests = (List<Test>)aTestManager.GetAllTest();
                
                int len = tests.Count;
                string[] testNames = new string[len];

                for (int i = 0; i < len; i++)
                {
                    testNames[i] = tests[i].Fee.ToString();
                }
                string testNameString = new JavaScriptSerializer().Serialize(testNames);

                allTestHiddenField.Value = testNameString;

                testDropdownlist.DataSource = tests;
                testDropdownlist.DataTextField = "Name";
                testDropdownlist.DataValueField = "Id";
                testDropdownlist.DataBind();
                List<Test> aTests = new List<Test>();
                ViewState["patientTest"] = aTests;

            }
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            // need update

            int SelectedTest = Convert.ToInt32(testDropdownlist.SelectedValue);
            Test aTest = aTestManager.GetTestById(SelectedTest);

            List<Test> aTests =(List<Test>) ViewState["patientTest"];

            if (aTests.Count == 0)
            {
                aTests = new List<Test>();
                aTests.Add(aTest);
            }
            else
            {
                aTests.Add(aTest);
            }

            ViewState["patientTest"] = aTests;

            testRequestGridView.DataSource = aTests;
            testRequestGridView.DataBind();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            // need update

            List<Test> aTests = new List<Test>();
            Test aTest = new Test();
            Patient aPatient = new Patient();
            aTests = (List<Test>)ViewState["patientTest"];

            aPatient.Name = patientNameTextBox.Text;
            aPatient.BirthDate = birthDateTextBox.Text;
            aPatient.MobileNo = mobileNoTextBox.Text;


            aPatientManager.SavePatient(aPatient);
            int patientId = aPatientManager.GetPatientId(aPatient);
            
            
            Payment aPayment = new Payment();
            aPayment.BillNo = aPaymentManager.GetUniqueBillNo();
            aPayment.IsPaid = false;
            aPayment.TotalFee = aPaymentManager.GetTotalFee(aTests);
            // TAKE INPUT FROM USER FORM
            aPayment.DueDate = "01/01/2018";


            aPaymentManager.SavePayment(aPayment);

            
            

            aTestRequestManager.RequestAllTest(aTests,patientId,aPayment.BillNo);


            ViewState["patientTest"] = new List<Test>();

        }

    }
}