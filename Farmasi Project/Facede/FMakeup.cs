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
    public class FMakeup
    {
        public static int MakeupAdd(EMakeup data)
        {
            int process = 0;
            try
            {
                SqlCommand command = new SqlCommand("MAdd", Baglanti.con);
                command.CommandType = CommandType.StoredProcedure;
                if (command.Connection.State != ConnectionState.Open)
                {
                    command.Connection.Open();
                }
                command.Parameters.AddWithValue("CategoryId", data.CategoryId);
                command.Parameters.AddWithValue("MakeupCategory", data.MakeupCategory);
                command.Parameters.AddWithValue("MakeupType", data.MakeupType);
                command.Parameters.AddWithValue("MakeupName", data.MakeupName);
                command.Parameters.AddWithValue("MakeupCode", data.MakeupCode);
                command.Parameters.AddWithValue("MakeupPrice", data.MakeupPrice);
                command.Parameters.AddWithValue("MakeupDescription", data.MakeupDescription);
                process = command.ExecuteNonQuery();

            }
            catch
            {
                process = -1;
            }
            return process;
        }
        public static DataTable MakeupList()
        {
            SqlDataAdapter adp = new SqlDataAdapter("MList", Baglanti.con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adp.Fill(dt);
            return dt;
        }

        public static bool MakeupUpdate(EMakeup process)
        {
            SqlCommand command = new SqlCommand("MUpdate", Baglanti.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("MakeupId", process.MakeupId);
            command.Parameters.AddWithValue("CategoryId", process.CategoryId);
            command.Parameters.AddWithValue("MakeupCategory", process.MakeupCategory);
            command.Parameters.AddWithValue("MakeupType", process.MakeupType);
            command.Parameters.AddWithValue("MakeupName", process.MakeupName);
            command.Parameters.AddWithValue("MakeupCode", process.MakeupCode);
            command.Parameters.AddWithValue("MakeupPrice", process.MakeupPrice);
            command.Parameters.AddWithValue("MakeupDescription", process.MakeupDescription);
            return Baglanti.ExecuteNonQuery(command);
        }

        public static bool MakeupDelete(EMakeup process)
        {
            SqlCommand command = new SqlCommand("MDelete", Baglanti.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("MakeupId", process.MakeupId);
            command.Parameters.AddWithValue("CategoryId", process.CategoryId);
            command.Parameters.AddWithValue("MakeupCategory", process.MakeupCategory);
            command.Parameters.AddWithValue("MakeupType", process.MakeupType);
            command.Parameters.AddWithValue("MakeupName", process.MakeupName);
            command.Parameters.AddWithValue("MakeupCode", process.MakeupCode);
            command.Parameters.AddWithValue("MakeupPrice", process.MakeupPrice);
            command.Parameters.AddWithValue("MakeupDescription", process.MakeupDescription);
            return Baglanti.ExecuteNonQuery(command);
        }
    }
}
