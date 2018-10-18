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
    public partial class PaymentUI : System.Web.UI.Page
    {
        PatientPaymentManager aPatientPaymentManager = new PatientPaymentManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            PatientPayment aPatientPayment = new PatientPayment();

            if (billNoTextBox.Text != "")
            {
                int BillNo = Convert.ToInt32(billNoTextBox.Text);
                aPatientPayment = aPatientPaymentManager.GetPatientPaymentByBillNo(BillNo);

            }
            else
            {
                string MobileNo = mobileNoTextBox.Text;
                aPatientPayment = aPatientPaymentManager.GetPatientPaymentByMobileNo(MobileNo);
            }

            dueDateTextbox.Text = aPatientPayment.DueDate;
            amountTextbox.Text = aPatientPayment.TotalFee.ToString();

            ViewState["payment"] = aPatientPayment;

        }

        protected void payButton_Click(object sender, EventArgs e)
        {
            PatientPayment aPatientPayment = (PatientPayment) ViewState["payment"];

            aPatientPayment.IsPaid = true;

            aPatientPaymentManager.UpdatePayment(aPatientPayment);
        }
    }
}