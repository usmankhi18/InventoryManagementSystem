using InventoryManagement.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryManagement.Domain.Interfaces
{
    public interface IProductRepository
    {
        Product GetProduct(int id);
        List<Product> GetAllProducts();
        bool InsertProducts(Product entity);
        bool UpdateProduct(Product entity);
        bool DeleteProduct(Product product);
        List<Product> GetProductsByManufacturerId(int manufacturerId);
    }
}
