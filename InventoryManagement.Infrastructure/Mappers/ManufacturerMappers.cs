using InventoryManagement.Domain.Models;
using InventoryManagement.Infrastructure.Repositories;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryManagement.Infrastructure.Mappers
{
    public class ManufacturerMappers
    {
        public static Manufacturer MapFromReader(SqlDataReader reader)
        {
            Manufacturer manufacturer = new Manufacturer();
            manufacturer.Id = reader.GetInt32(reader.GetOrdinal("Id"));
            manufacturer.Name = reader.GetString(reader.GetOrdinal("Name"));
            manufacturer.Description = reader.GetString(reader.GetOrdinal("Description"));
            manufacturer.Country = reader.GetString(reader.GetOrdinal("Country"));
            manufacturer.YearFounded = reader.GetInt32(reader.GetOrdinal("YearFounded"));
            manufacturer.Website = reader.GetString(reader.GetOrdinal("Website"));
            manufacturer.Email = reader.GetString(reader.GetOrdinal("Email"));
            manufacturer.Phone = reader.GetString(reader.GetOrdinal("Phone"));
            manufacturer.LogoPath = reader.GetString(reader.GetOrdinal("LogoPath"));
            manufacturer.Products = new List<Product>();
            return manufacturer;
        }

        public static void SetInsertParameters(SqlCommand command, Manufacturer manufacturer)
        {
            command.Parameters.AddWithValue("@Name", manufacturer.Name);
            command.Parameters.AddWithValue("@Description", manufacturer.Description);
            command.Parameters.AddWithValue("@Country", manufacturer.Country);
            command.Parameters.AddWithValue("@YearFounded", manufacturer.YearFounded);
            command.Parameters.AddWithValue("@Website", manufacturer.Website);
            command.Parameters.AddWithValue("@Email", manufacturer.Email);
            command.Parameters.AddWithValue("@Phone", manufacturer.Phone);
            command.Parameters.AddWithValue("@LogoPath", manufacturer.LogoPath);
            command.Parameters.AddWithValue("@IsActive", 1);
            command.Parameters.AddWithValue("@CreatedAt", DateTime.Now);
        }

        public static void SetDeleteParameters(SqlCommand command, Manufacturer manufacturer)
        {
            command.Parameters.AddWithValue("@Id", manufacturer.Id);
        }

        public static void SetUpdateParameters(SqlCommand command, Manufacturer manufacturer)
        {
            command.Parameters.AddWithValue("@Id", manufacturer.Id);
            command.Parameters.AddWithValue("@Name", manufacturer.Name);
            command.Parameters.AddWithValue("@Description", manufacturer.Description);
            command.Parameters.AddWithValue("@Country", manufacturer.Country);
            command.Parameters.AddWithValue("@YearFounded", manufacturer.YearFounded);
            command.Parameters.AddWithValue("@Website", manufacturer.Website);
            command.Parameters.AddWithValue("@Email", manufacturer.Email);
            command.Parameters.AddWithValue("@Phone", manufacturer.Phone);
            command.Parameters.AddWithValue("@LogoPath", manufacturer.LogoPath);
            command.Parameters.AddWithValue("@IsActive", 1);
            command.Parameters.AddWithValue("@UpdatedAt", DateTime.Now);
        }
    }
}
