using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.DAL.GATEWAY
{
    public class PaymentGateway:ParentGateway
    {
        public bool IsBillNoUniqe(int billNo)
        {
            bool unique;

            Query = "SELECT * FROM Payment WHERE BillNo = @billNo";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add("billNo", SqlDbType.Int).Value = billNo;

            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                unique = false;
            }
            else
            {
                unique = true;
            }
            Reader.Close();
            Connection.Close();

            return unique;
        }

        public void SavePayment(Payment aPayment)
        {

            Query = "INSERT INTO Payment VALUES(@billNO, @totalFee, @dueDate, @isPaid)";
            Command = new SqlCommand(Query,Connection);
            Command.Parameters.Add("billNo", SqlDbType.Int).Value = aPayment.BillNo;
            Command.Parameters.Add("totalFee", SqlDbType.Int).Value = aPayment.TotalFee;
            Command.Parameters.Add("dueDate", SqlDbType.VarChar).Value = aPayment.DueDate;
            Command.Parameters.Add("isPaid", SqlDbType.Bit).Value = aPayment.IsPaid;

            Connection.Open();
            Command.ExecuteNonQuery();
            Connection.Close();
        }
    }
}