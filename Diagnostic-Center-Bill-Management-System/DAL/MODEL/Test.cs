using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Web;

namespace Diagnostic_Center_Bill_Management_System.DAL.MODEL
{
    [Serializable]
    public class Test
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Fee { get; set; }
        public int TypeId { get; set; }

    }
}