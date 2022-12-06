using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using System.Data.SqlClient;
using System.Data;
namespace Facede
{
    public class FPersonelCare
    {
        public static int PersonelCareAdd(EPersonelCare data)
        {
            int process = 0;
            try
            {
                SqlCommand command = new SqlCommand("PCAdd", Baglanti.con);
                command.CommandType = CommandType.StoredProcedure;
                if (command.Connection.State != ConnectionState.Open)
                {
                    command.Connection.Open();
                }
                command.Parameters.AddWithValue("CategoryId", data.CategoryId);
                command.Parameters.AddWithValue("PersonelCareCategory", data.PersonelCareCategory);
                command.Parameters.AddWithValue("PersonelCareType", data.PersonelCareType);
                command.Parameters.AddWithValue("PersonelCareName", data.PersonelCareName);
                command.Parameters.AddWithValue("PersonelCareCode", data.PersonelCareCode);
                command.Parameters.AddWithValue("PersonelCarePrice", data.PersonelCarePrice);
                command.Parameters.AddWithValue("PersonelCareDescription", data.PersonelCareDescription);
                process = command.ExecuteNonQuery();

            }
            catch
            {
                process = -1;
            }
            return process;
        }
        public static DataTable PersonelCareList()
        {
            SqlDataAdapter adp = new SqlDataAdapter("PCList", Baglanti.con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adp.Fill(dt);
            return dt;
        }

        public static bool PersonelCareUpdate(EPersonelCare process)
        {
            SqlCommand command = new SqlCommand("PCUpdate", Baglanti.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("PersonelCareId", process.PersonelCareId);
            command.Parameters.AddWithValue("CategoryId", process.CategoryId);
            command.Parameters.AddWithValue("PersonelCareCategory", process.PersonelCareCategory);
            command.Parameters.AddWithValue("PersonelCareType", process.PersonelCareType);
            command.Parameters.AddWithValue("PersonelCareName", process.PersonelCareName);
            command.Parameters.AddWithValue("PersonelCareCode", process.PersonelCareCode);
            command.Parameters.AddWithValue("PersonelCarePrice", process.PersonelCarePrice);
            command.Parameters.AddWithValue("PersonelCareDescription", process.PersonelCareDescription);
            return Baglanti.ExecuteNonQuery(command);
        }

        public static bool PersonelCareDelete(EPersonelCare process)
        {
            SqlCommand command = new SqlCommand("PCDelete", Baglanti.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("PersonelCareId", process.PersonelCareId);
            command.Parameters.AddWithValue("CategoryId", process.CategoryId);
            command.Parameters.AddWithValue("PersonelCareCategory", process.PersonelCareCategory);
            command.Parameters.AddWithValue("PersonelCareType", process.PersonelCareType);
            command.Parameters.AddWithValue("PersonelCareName", process.PersonelCareName);
            command.Parameters.AddWithValue("PersonelCareCode", process.PersonelCareCode);
            command.Parameters.AddWithValue("PersonelCarePrice", process.PersonelCarePrice);
            command.Parameters.AddWithValue("PersonelCareDescription", process.PersonelCareDescription);
            return Baglanti.ExecuteNonQuery(command);
        }
    }
}
