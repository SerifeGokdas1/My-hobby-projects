using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.CodeDom;

namespace Facede
{
    public class Baglanti
    {
        public static readonly SqlConnection con= new SqlConnection("Server= DESKTOP-V44T9NQ\\SQLEXPRESS;Database=FarmasiProducts;Integrated Security=true;");

        public static bool ExecuteNonQuery(SqlCommand command)
        {
            try { if (command.Connection.State != System.Data.ConnectionState.Open)
                    command.Connection.Open();
                return command.ExecuteNonQuery() > 0;
            }catch (Exception)
            {
                return false; 
            }
            finally
            {
                if (command.Connection.State != System.Data.ConnectionState.Closed) command.Connection.Close();
            }
        }
    }
}
