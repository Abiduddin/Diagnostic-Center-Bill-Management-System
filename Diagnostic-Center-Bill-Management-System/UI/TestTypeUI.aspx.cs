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
    public partial class TestTypeUI : System.Web.UI.Page
    {
        TestTypeManager aTestTypeManager = new TestTypeManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            TestType aTestType = new TestType();
            aTestType.Name = typeNameTextBox.Text;

            aTestTypeManager.SaveTestType(aTestType);

        }

    }
}