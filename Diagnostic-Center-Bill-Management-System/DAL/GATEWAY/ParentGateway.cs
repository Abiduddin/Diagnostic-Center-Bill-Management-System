using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Management;

namespace Diagnostic_Center_Bill_Management_System.DAL.GATEWAY
{
    public class ParentGateway
    {
        private string ConnectionString = WebConfigurationManager.ConnectionStrings["DiagnosticDB"].ConnectionString;

        public string Query { get; set; }

        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }

        protected ParentGateway()
        {
            Connection = new SqlConnection(ConnectionString);
        }

    }
}