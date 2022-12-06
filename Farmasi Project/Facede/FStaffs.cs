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
    public class FStaffs
    {
        public static int StaffsAdd(EStaffs data)
        {
            int process = 0;
            try
            {
                SqlCommand command = new SqlCommand("SAdd", Baglanti.con);
                command.CommandType = CommandType.StoredProcedure;
                if (command.Connection.State != ConnectionState.Open)
                {
                    command.Connection.Open();
                }
                command.Parameters.AddWithValue("StaffNameSurname", data.StaffNameSurname);
                command.Parameters.AddWithValue("StaffPassword", data.StaffPassword);
                command.Parameters.AddWithValue("StaffMail", data.StaffMail);
                command.Parameters.AddWithValue("StaffPhone", data.StaffPhone);
                process = command.ExecuteNonQuery();

            }
            catch
            {
                process = -1;
            }
            return process;
        }
        public static DataTable StaffsList()
        {
            SqlDataAdapter adp = new SqlDataAdapter("SList", Baglanti.con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adp.Fill(dt);
            return dt;
        }

        public static bool StaffsUpdate(EStaffs process)
        {
            SqlCommand command = new SqlCommand("SUpdate", Baglanti.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("StaffId", process.StaffId);
            command.Parameters.AddWithValue("StaffNameSurname", process.StaffNameSurname);
            command.Parameters.AddWithValue("StaffPassword", process.StaffPassword);
            command.Parameters.AddWithValue("StaffMail", process.StaffMail);
            command.Parameters.AddWithValue("StaffPhone", process.StaffPhone);
            return Baglanti.ExecuteNonQuery(command);
        }

        public static bool StaffsDelete(EStaffs process)
        {
            SqlCommand command = new SqlCommand("SDelete", Baglanti.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("StaffId", process.StaffId);
            command.Parameters.AddWithValue("StaffNameSurname", process.StaffNameSurname);
            command.Parameters.AddWithValue("StaffPassword", process.StaffPassword);
            command.Parameters.AddWithValue("StaffMail", process.StaffMail);
            command.Parameters.AddWithValue("StaffPhone", process.StaffPhone);
            return Baglanti.ExecuteNonQuery(command);
        }
    }
}
