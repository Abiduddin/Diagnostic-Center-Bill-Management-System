using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Diagnostic_Center_Bill_Management_System.BLL;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.UI
{
    public partial class TestSetupUI : System.Web.UI.Page
    {
        TestTypeManager aTestTypeManager = new TestTypeManager();
        TestManager aTestManager = new TestManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<TestType> aTestTypes = aTestTypeManager.GetAllTestTypes();
                testTypeDropdownlist.DataSource = aTestTypes;
                testTypeDropdownlist.DataValueField = "Id";
                testTypeDropdownlist.DataTextField = "Name";
                testTypeDropdownlist.DataBind();
            }

            DisplayTest();

        }

        private void DisplayTest()
        {
            TestGridView.DataSource = aTestManager.GetAllTest();
            TestGridView.DataBind();
        }


        protected void testSaveButton_Click(object sender, EventArgs e)
        {
            Test aTest = new Test();

            aTest.Name = testNameTextBox.Text;
            aTest.Fee = Convert.ToInt32(testFeeTextBox.Text);
            aTest.TypeId = Convert.ToInt32(testTypeDropdownlist.SelectedValue);

            aTestManager.SaveTest(aTest);

            DisplayTest();
        }
    }
}