using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace QLBanHangGiaDung.model
{
    public class SqlConnectionData
    {
        public static SqlConnection Connect()
        {
            string strCnn = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
            SqlConnection cnn = null;
            if (cnn == null)
            {
                cnn = new SqlConnection(strCnn);
            }
            if (cnn.State == ConnectionState.Closed)
            {
                cnn.Open();
            }
            return cnn;
        }
    }
    public class model
    {
       // function here
    }
}