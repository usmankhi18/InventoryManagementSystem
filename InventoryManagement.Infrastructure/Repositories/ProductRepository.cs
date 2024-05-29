using InventoryManagement.Domain.Interfaces;
using InventoryManagement.Domain.Models;
using InventoryManagement.Infrastructure.Mappers;
using Microsoft.Data.SqlClient;
using System.Data;

namespace InventoryManagement.Infrastructure.Repositories
{
    public class ProductRepository : IProductRepository
    {
        ApplicationDbContext _context;

        private readonly IDatabaseContext databaseContext;

        public ProductRepository(IDatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }

        public bool InsertProducts(Product product)
        {
            databaseContext.Open();

            using (SqlCommand command = new SqlCommand("AddProduct"))
            {
                command.CommandType = CommandType.StoredProcedure;
                ProductMapper.SetInsertParameters(command, product);

                int rowsAffected = databaseContext.ExecuteNonQuery(command);

                databaseContext.Close();

                return rowsAffected > 0;
            }
        }

        public bool DeleteProduct(Product product)
        {
            databaseContext.Open();

            using (SqlCommand command = new SqlCommand("DeleteProduct"))
            {
                command.CommandType = CommandType.StoredProcedure;
                ProductMapper.SetDeleteParameters(command, product);

                int rowsAffected = databaseContext.ExecuteNonQuery(command);

                databaseContext.Close();

                return rowsAffected > 0;
            }
        }

        public List<Product> GetAllProducts()
        {
            List<Product> returningProducts = new List<Product>();

            databaseContext.Open();

            using (SqlCommand command = new SqlCommand("GetAllProducts"))
            {
                command.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = databaseContext.ExecuteReader(command);

                while (reader.Read())
                {
                    Product product = ProductMapper.MapFromReader(reader);
                    returningProducts.Add(product);
                }

                reader.Close();
            }

            databaseContext.Close();

            return returningProducts;
        }

        public Product GetProduct(int productId)
        {
            Product product = new Product();
            databaseContext.Open();

            using (SqlCommand command = new SqlCommand("GetProductById"))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", productId);

                SqlDataReader reader = databaseContext.ExecuteReader(command);

                while (reader.Read())
                {
                    product = ProductMapper.MapFromReader(reader);
                }

                reader.Close();
            }

            databaseContext.Close();

            return product;
        }

        public bool UpdateProduct(Product product)
        {
            databaseContext.Open();

            using (SqlCommand command = new SqlCommand("UpdateProduct"))
            {
                command.CommandType = CommandType.StoredProcedure;
                ProductMapper.SetUpdateParameters(command, product);

                int rowsAffected = databaseContext.ExecuteNonQuery(command);

                databaseContext.Close();

                return rowsAffected > 0;
            }
        }

        public List<Product> GetProductsByManufacturerId(int manufacturerId)
        {
            List<Product> returningProducts = new List<Product>();

            databaseContext.Open();

            using (SqlCommand command = new SqlCommand("GetProductsByManufacturerId"))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ManufacturerId", manufacturerId);
                SqlDataReader reader = databaseContext.ExecuteReader(command);

                while (reader.Read())
                {
                    Product product = ProductMapper.MapFromReader(reader);
                    returningProducts.Add(product);
                }

                reader.Close();
            }

            databaseContext.Close();

            return returningProducts;
        }
    }
}