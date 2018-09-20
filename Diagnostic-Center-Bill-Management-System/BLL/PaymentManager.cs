using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.GATEWAY;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.BLL
{
    public class PaymentManager
    {
        PaymentGateway aPaymentGateway = new PaymentGateway();
        public int GetTotalFee(List<Test> aTests)
        {
            int totalFee = 0;

            foreach (Test test in aTests)
            {
                totalFee += test.Fee;
            }
            return totalFee;
        }

        public int GetUniqueBillNo()
        {
            Random aRandom = new Random();
            int billNo = aRandom.Next(1000000, 9999999);

            while (!aPaymentGateway.IsBillNoUniqe(billNo))
            {
                billNo = aRandom.Next(1000000, 9999999);
            }

            return billNo;
        }

        public void SavePayment(Payment aPayment)
        {
            aPaymentGateway.SavePayment(aPayment);
        }
    }
}