using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.GATEWAY.VIEW;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL.VIEW_MODEL;

namespace Diagnostic_Center_Bill_Management_System.BLL.VIEW
{
    public class PatientPaymentManager
    {
        PatientPaymentGateway aPatientPaymentGateway = new PatientPaymentGateway();
        public PatientPayment GetPatientPaymentByBillNo(int billNo)
        {
            return aPatientPaymentGateway.GetPatientPaymentByBillNo(billNo);
        }

        public PatientPayment GetPatientPaymentByMobileNo(string mobileNo)
        {

            return aPatientPaymentGateway.GetPatientPaymentByMobileNo(mobileNo);
        }

        public void UpdatePayment(PatientPayment aPatientPayment)
        {

            aPatientPaymentGateway.UpdatePayment(aPatientPayment);
        }
    }
}