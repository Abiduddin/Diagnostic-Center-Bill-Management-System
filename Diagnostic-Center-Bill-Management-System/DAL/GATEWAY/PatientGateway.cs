using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.DAL.GATEWAY
{
    public class PatientGateway:ParentGateway
    {
        public void SavePatient(Patient aPatient)
        {
            Query = "INSERT INTO Patient VALUES (@name, @birthDate, @mobileNo)";

            Command = new SqlCommand(Query,Connection);
            Command.Parameters.Add("name", SqlDbType.VarChar).Value = aPatient.Name;
            Command.Parameters.Add("birthDate", SqlDbType.VarChar).Value = aPatient.BirthDate;
            Command.Parameters.Add("mobileNo", SqlDbType.VarChar).Value = aPatient.MobileNo;

            Connection.Open();
            Command.ExecuteNonQuery();
            Connection.Close();

        }

        public int GetPatientId(Patient aPatient)
        {
            Query = "SELECT * FROM Patient WHERE Birthdate = @date and MobileNo = @mobileNo";
            Command = new SqlCommand(Query,Connection);
            Command.Parameters.Add("date", SqlDbType.VarChar).Value = aPatient.BirthDate;
            Command.Parameters.Add("mobileNo", SqlDbType.VarChar).Value = aPatient.MobileNo;

            Connection.Open();
            Reader = Command.ExecuteReader();
            int id = -1;
            if (Reader.HasRows)
            {
                Reader.Read();
                id = Convert.ToInt32(Reader["Id"]);
            }

            return id;
        }


    }
}