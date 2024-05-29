using InventoryManagement.Domain.Models;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace InventoryManagement.Infrastructure.Mappers
{
    public class ProductMapper
    {
        public static Product MapFromReader(SqlDataReader reader)
        {
            Product products = new Product();
            products.Id = reader.GetInt32(reader.GetOrdinal("Id"));
            products.ManufacturerId = reader.GetInt32(reader.GetOrdinal("ManufacturerId"));
            products.Name = reader.GetString(reader.GetOrdinal("Name"));
            products.Description = reader.GetString(reader.GetOrdinal("Description"));
            products.Price = reader.GetDecimal(reader.GetOrdinal("Price"));
            products.LogoPath = reader.IsDBNull(reader.GetOrdinal("LogoPath")) ? null : reader.GetString(reader.GetOrdinal("LogoPath")).ToString();
            return products;
        }
        
        public static void SetInsertParameters(SqlCommand command, Product product)
        {
            command.Parameters.AddWithValue("@ManufacturerId", product.ManufacturerId);
            command.Parameters.AddWithValue("@Name", product.Name);
            command.Parameters.AddWithValue("@Description", product.Description);
            command.Parameters.AddWithValue("@Price", product.Price);
            command.Parameters.AddWithValue("@LogoPath", product.LogoPath);
            command.Parameters.AddWithValue("@IsActive", 1);
            command.Parameters.AddWithValue("@CreatedAt", DateTime.Now);
        }
        
        public static void SetDeleteParameters(SqlCommand command, Product product)
        {
            command.Parameters.AddWithValue("@Id", product.Id);
        }
        
        public static void SetUpdateParameters(SqlCommand command, Product product)
        {
            command.Parameters.AddWithValue("@Id", product.Id);
            command.Parameters.AddWithValue("@ManufacturerId", product.ManufacturerId);
            command.Parameters.AddWithValue("@Name", product.Name);
            command.Parameters.AddWithValue("@Description", product.Description);
            command.Parameters.AddWithValue("@Price", product.Price);
            command.Parameters.AddWithValue("@LogoPath", product.LogoPath);
            command.Parameters.AddWithValue("@IsActive", 1);
            command.Parameters.AddWithValue("@UpdatedAt", DateTime.Now);
        }
    }
}
