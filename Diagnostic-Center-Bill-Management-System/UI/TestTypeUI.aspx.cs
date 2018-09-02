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
            DisplayTestType();
        }


        void DisplayTestType()
        {
            List<TestType> aTestTypes = aTestTypeManager.GetAllTestTypes();
            typeViewGridView.DataSource = aTestTypes;
            typeViewGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string Name = typeNameTextBox.Text;

            if (!aTestTypeManager.IsUniqeTestTypeName(Name))
            {
                TestType aTestType = new TestType();
                aTestType.Name = Name;

                aTestTypeManager.SaveTestType(aTestType);
            }
            else
            {
                
            }

            

            DisplayTestType();

        }


    }
}