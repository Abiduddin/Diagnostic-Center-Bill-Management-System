using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.SqlServer.Server;

namespace Diagnostic_Center_Bill_Management_System.DAL.MODEL
{
    public class Patient
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string BirthDate { get; set; }
        public string MobileNo { get; set; }
        
    }
}