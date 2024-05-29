using InventoryManagement.Domain.Interfaces;
using InventoryManagement.Domain.Models;
using InventoryManagement.Infrastructure.Mappers;
using Microsoft.Data.SqlClient;
using System.Data;

namespace InventoryManagement.Infrastructure.Repositories
{
    public class ManufacturerRepository : IManufacturerRepository
    {
        private readonly IDatabaseContext databaseContext;

        public ManufacturerRepository(IDatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }

        public bool InsertManufacturers(Manufacturer manufacturer)
        {
            databaseContext.Open();

            using (SqlCommand command = new SqlCommand("AddManufacturer"))
            {
                command.CommandType = CommandType.StoredProcedure;
                ManufacturerMappers.SetInsertParameters(command, manufacturer);

                int rowsAffected = databaseContext.ExecuteNonQuery(command);

                databaseContext.Close();

                return rowsAffected > 0;
            }
        }

        public bool DeleteManufacturer(Manufacturer manufacturer)
        {
            databaseContext.Open();

            using (SqlCommand command = new SqlCommand("DeleteManufacturer"))
            {
                command.CommandType = CommandType.StoredProcedure;
                ManufacturerMappers.SetDeleteParameters(command, manufacturer);

                int rowsAffected = databaseContext.ExecuteNonQuery(command);

                databaseContext.Close();

                return rowsAffected > 0;
            }
        }

        public List<Manufacturer> GetAllManufacturers()
        {
            List<Manufacturer> returningManufacturers = new List<Manufacturer>();

            databaseContext.Open();

            using (SqlCommand command = new SqlCommand("GetAllManufacturers"))
            {
                command.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = databaseContext.ExecuteReader(command);

                while (reader.Read())
                {
                    Manufacturer manufacturer = ManufacturerMappers.MapFromReader(reader,databaseContext);
                    returningManufacturers.Add(manufacturer);
                }

                reader.Close();
            }

            databaseContext.Close();

            return returningManufacturers;
        }

        public Manufacturer GetManufacturer(int manufacturerId)
        {
            Manufacturer manufacturer = new Manufacturer();
            databaseContext.Open();

            using (SqlCommand command = new SqlCommand("GetManufacturerById"))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", manufacturerId);

                SqlDataReader reader = databaseContext.ExecuteReader(command);

                while (reader.Read())
                {
                    manufacturer = ManufacturerMappers.MapFromReader(reader, databaseContext);
                }

                reader.Close();
            }

            databaseContext.Close();

            return manufacturer;
        }

        public bool UpdateManufacturer(Manufacturer entity)
        {
            databaseContext.Open();

            using (SqlCommand command = new SqlCommand("UpdateManufacturer"))
            {
                command.CommandType = CommandType.StoredProcedure;
                ManufacturerMappers.SetUpdateParameters(command, entity);

                int rowsAffected = databaseContext.ExecuteNonQuery(command);

                databaseContext.Close();

                return rowsAffected > 0;
            }
        }
    }
}