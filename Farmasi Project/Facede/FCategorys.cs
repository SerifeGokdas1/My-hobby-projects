using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using System.Data.SqlClient;
using System.Data;
using System.Linq.Expressions;

namespace Facede
{
    public class FCategorys
    {
        public static int CategoryAdd (ECategorys data)
        {
            int process = 0;
            try
            {
                SqlCommand command = new SqlCommand("CAdd", Baglanti.con);
                command.CommandType = CommandType.StoredProcedure;
                if (command.Connection.State != ConnectionState.Open)
                {
                    command.Connection.Open();
                }
                command.Parameters.AddWithValue("CategoryName", data.CategoryName);
                process = command.ExecuteNonQuery();

            }
            catch
            {
                process = -1;
            }
            return process;
            }
        public static DataTable CategoryList()
        {
            SqlDataAdapter adp = new SqlDataAdapter("CList", Baglanti.con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adp.Fill(dt);
            return dt;
        }

        public static bool CategoryUpdate(ECategorys process)
        {
            SqlCommand command = new SqlCommand("CUpdate", Baglanti.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("CategoryId", process.CategoryId);
            command.Parameters.AddWithValue("CategoryName", process.CategoryName);
            return Baglanti.ExecuteNonQuery(command);
        }

        public static bool CategoryDelete (ECategorys process)
        {
            SqlCommand command = new SqlCommand("CDelete", Baglanti.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("CategoryId", process.CategoryId);
            command.Parameters.AddWithValue("CategoryName", process.CategoryName);
            return Baglanti.ExecuteNonQuery(command);
        }
    }
}

    

