using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Diagnostic_Center_Bill_Management_System.DAL.GATEWAY;
using Diagnostic_Center_Bill_Management_System.DAL.MODEL;

namespace Diagnostic_Center_Bill_Management_System.BLL
{
    public class PatientManager
    {
        PatientGateway aPatientGateway = new PatientGateway();
        public void SavePatient(Patient aPatient)
        {
            aPatientGateway.SavePatient(aPatient);
        }

        public int GetPatientId(Patient aPatient)
        {
            return aPatientGateway.GetPatientId(aPatient);
        }


    }
}