using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL.VIEW_MODEL;

namespace Diagnostic_Center_Bill_Management_System.DAL.GATEWAY.VIEW
{
    public class PatientPaymentGateway:ParentGateway
    {
        public PatientPayment GetPatientPaymentByBillNo(int billNo)
        {
            Query = "SELECT * FROM PatientPayment WHERE BillNo = @billno";
            Command = new SqlCommand(Query,Connection);
            Command.Parameters.Add("billNo", SqlDbType.Int).Value = billNo;
            Connection.Open();
            Reader = Command.ExecuteReader();
            PatientPayment aPatientPayment = null;

            if (Reader.HasRows)
            {
                Reader.Read();
                aPatientPayment = new PatientPayment();
                aPatientPayment.BillNo = Convert.ToInt32(Reader["BillNo"]);
                aPatientPayment.MobileNo = Reader["MobileNo"].ToString();
                aPatientPayment.DueDate = Reader["DueDate"].ToString();
                aPatientPayment.IsPaid = Convert.ToBoolean(Reader["IsPaid"]);
                aPatientPayment.TotalFee = Convert.ToInt32(Reader["TotalFee"]);

            }

            Reader.Close();
            Connection.Close();

            return aPatientPayment;
        }

        public PatientPayment GetPatientPaymentByMobileNo(string mobileNo)
        {
            Query = "SELECT * FROM PatientPayment WHERE MobileNo = @mobileNo";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add("mobileNo", SqlDbType.Int).Value = mobileNo;
            Connection.Open();
            Reader = Command.ExecuteReader();
            PatientPayment aPatientPayment = null;

            if (Reader.HasRows)
            {
                Reader.Read();
                aPatientPayment = new PatientPayment();
                aPatientPayment.BillNo = Convert.ToInt32(Reader["BillNo"]);
                aPatientPayment.MobileNo = Reader["MobileNo"].ToString();
                aPatientPayment.DueDate = Reader["DueDate"].ToString();
                aPatientPayment.IsPaid = Convert.ToBoolean(Reader["IsPaid"]);
                aPatientPayment.TotalFee = Convert.ToInt32(Reader["TotalFee"]);

            }

            Reader.Close();
            Connection.Close();

            return aPatientPayment;
        }

        public void UpdatePayment(PatientPayment aPatientPayment)
        {

            Query = "UPDATE Payment SET IsPaid = @paid WHERE BillNo = @billNo";
            Command = new SqlCommand(Query,Connection);
            Command.Parameters.Add("paid", SqlDbType.Bit).Value = aPatientPayment.IsPaid;
            Command.Parameters.Add("billNo", SqlDbType.Int).Value = aPatientPayment.BillNo;
            Connection.Open();

            Command.ExecuteNonQuery();
            
            Connection.Close();

        }
    }
}