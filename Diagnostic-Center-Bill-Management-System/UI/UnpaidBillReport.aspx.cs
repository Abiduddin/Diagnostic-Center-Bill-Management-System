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
    public partial class UnpaidBillReport : System.Web.UI.Page
    {
        UnpaidBillReportManager aUnpaidBillReportManager = new UnpaidBillReportManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void showButton_Click(object sender, EventArgs e)
        {
            string toDate = toDateTextBox.Text;
            string fromDate = fromDateTextBox.Text;
            List<UnpaidBillView> aUnpaidBillViews = aUnpaidBillReportManager.GetAllUnpaidBill(toDate, fromDate);

            int totalMoney = 0;
            foreach (var item in aUnpaidBillViews)
            {
                totalMoney += item.TotalFee;
            }

            totalMoneyTextBox.Text = totalMoney.ToString();
            UnpaidGridView.DataSource = aUnpaidBillViews;
            UnpaidGridView.DataBind();

        }
    }
}