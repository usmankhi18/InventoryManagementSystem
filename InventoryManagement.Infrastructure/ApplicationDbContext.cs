using Microsoft.Data.SqlClient;

namespace InventoryManagement.Infrastructure
{
    public interface IDatabaseContext
    {
        void Open();
        void Close();
        SqlDataReader ExecuteReader(SqlCommand command);
        int ExecuteNonQuery(SqlCommand command);
    }

    public class ApplicationDbContext : IDatabaseContext
    {
        private readonly SqlConnection connection;

        public ApplicationDbContext(string connectionString)
        {
            connection = new SqlConnection(connectionString);
        }

        public void Open()
        {
            connection.Open();
        }

        public void Close()
        {
            connection.Close();
        }

        public SqlDataReader ExecuteReader(SqlCommand command)
        {
            command.Connection = connection;
            return command.ExecuteReader();
        }

        public int ExecuteNonQuery(SqlCommand command)
        {
            command.Connection = connection;
            return command.ExecuteNonQuery();
        }
    }
}
