using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Diagnostic_Center_Bill_Management_System.BLL.VIEW;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL.VIEW_MODEL;

namespace Diagnostic_Center_Bill_Management_System.UI
{
    public partial class TypeWiseReportUI : System.Web.UI.Page
    {
        TypeWiseReportManager aTypeWiseReportManager = new TypeWiseReportManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void showButton_Click(object sender, EventArgs e)
        {
            string toDate = toDateTextBox.Text;
            string fromDate = fromDateTextBox.Text;

            List<TypeWiseReport> aTypeWiseReports = aTypeWiseReportManager.GetAllTestTypeReports(toDate, fromDate);
            int totalMoney = 0;
            foreach (var item in aTypeWiseReports)
            {
                totalMoney += item.TotalAmount;
            }

            totalMoneyTextBox.Text = totalMoney.ToString();
            TypeWiseReportGridView.DataSource = aTypeWiseReports;
            TypeWiseReportGridView.DataBind();
        }
    }
}