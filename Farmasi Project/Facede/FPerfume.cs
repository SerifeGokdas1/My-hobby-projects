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
    public class FPerfume
    {
        public static int PerfumeAdd(EPerfume data)
        {
            int process = 0;
            try
            {
                SqlCommand command = new SqlCommand("PAdd", Baglanti.con);
                command.CommandType = CommandType.StoredProcedure;
                if (command.Connection.State != ConnectionState.Open)
                {
                    command.Connection.Open();
                }
                command.Parameters.AddWithValue("CategoryId", data.CategoryId);
                command.Parameters.AddWithValue("PerfumeCategory", data.PerfumeCategory);
                command.Parameters.AddWithValue("PerfumeType", data.PerfumeType);
                command.Parameters.AddWithValue("PerfumeName", data.PerfumeName);
                command.Parameters.AddWithValue("PerfumeCode", data.PerfumeCode);
                command.Parameters.AddWithValue("PerfumePrice", data.PerfumePrice);
                command.Parameters.AddWithValue("PerfumeDescription", data.PerfumeDescription);
                process = command.ExecuteNonQuery();

            }
            catch
            {
                process = -1;
            }
            return process;
        }
        public static DataTable PerfumeList()
        {
            SqlDataAdapter adp = new SqlDataAdapter("PList", Baglanti.con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adp.Fill(dt);
            return dt;
        }

        public static bool PerfumeUpdate(EPerfume process)
        {
            SqlCommand command = new SqlCommand("PUpdate", Baglanti.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("PerfumeId", process.PerfumeId);
            command.Parameters.AddWithValue("CategoryId", process.CategoryId);
            command.Parameters.AddWithValue("PerfumeCategory", process.PerfumeCategory);
            command.Parameters.AddWithValue("PerfumeType", process.PerfumeType);
            command.Parameters.AddWithValue("PerfumeName", process.PerfumeName);
            command.Parameters.AddWithValue("PerfumeCode", process.PerfumeCode);
            command.Parameters.AddWithValue("PerfumePrice", process.PerfumePrice);
            command.Parameters.AddWithValue("PerfumeDescription", process.PerfumeDescription);
            return Baglanti.ExecuteNonQuery(command);
        }

        public static bool PerfumeDelete(EPerfume process)
        {
            SqlCommand command = new SqlCommand("PDelete", Baglanti.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("PerfumeId", process.PerfumeId);
            command.Parameters.AddWithValue("CategoryId", process.CategoryId);
            command.Parameters.AddWithValue("PerfumeCategory", process.PerfumeCategory);
            command.Parameters.AddWithValue("PerfumeType", process.PerfumeType);
            command.Parameters.AddWithValue("PerfumeName", process.PerfumeName);
            command.Parameters.AddWithValue("PerfumeCode", process.PerfumeCode);
            command.Parameters.AddWithValue("PerfumePrice", process.PerfumePrice);
            command.Parameters.AddWithValue("PerfumeDescription", process.PerfumeDescription);
            return Baglanti.ExecuteNonQuery(command);
        }
    }
}
