using Global.AppSettings;
using InventoryManagement.Application.ApplicationCache;
using InventoryManagement.Application.Interfaces;
using InventoryManagement.Domain.Interfaces;
using InventoryManagement.Domain.Models;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryManagement.Application
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _productRepository;
        private readonly ICommonService _commonService;
        private readonly ILogger<ProductService> _logger;
        private readonly ProductsCache productCache;

        public ProductService(ICommonService commonService, IProductRepository productRepository, ILogger<ProductService> logger, ProductsCache cache)
        {
            _productRepository = productRepository;
            _commonService = commonService;
            _logger = logger;
            productCache = cache;
        }

        public void AddProduct(Product product)
        {
            try
            {
                _logger.LogInformation("Adding a new product.");
                product.LogoPath = _commonService.SaveImage(product.LogoPath);
                _productRepository.InsertProducts(product);
                productCache.ClearCache(AppSettingKeys.RedisKey);
                _logger.LogInformation("Product added successfully.");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding a product.");
                throw;
            }
        }

        public void DeleteProduct(int id)
        {
            try
            {
                _logger.LogInformation($"Deleting product with ID: {id}.");
                var product = _productRepository.GetProduct(id);
                if (product == null)
                {
                    _logger.LogWarning($"Product with ID: {id} not found.");
                    return;
                }
                _productRepository.DeleteProduct(product);
                productCache.ClearCache(AppSettingKeys.RedisKey);
                _logger.LogInformation("Product deleted successfully.");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while deleting product with ID: {id}.");
                throw;
            }
        }

        public List<Product> GetAllProducts()
        {
            try
            {
                _logger.LogInformation("Retrieving all products.");
                List<Product> products = productCache.GetProductsFromCache(AppSettingKeys.RedisKey);
                if (products == null)
                {
                    products = _productRepository.GetAllProducts();
                }
                _logger.LogInformation("Products retrieved successfully.");
                return products;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while retrieving all products.");
                throw;
            }
        }

        public Product GetProductById(int id)
        {
            try
            {
                _logger.LogInformation($"Retrieving product with ID: {id}.");
                var product = _productRepository.GetProduct(id);
                if (product == null)
                {
                    _logger.LogWarning($"Product with ID: {id} not found.");
                }
                else
                {
                    _logger.LogInformation("Product retrieved successfully.");
                }
                return product;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while retrieving product with ID: {id}.");
                throw;
            }
        }

        public void UpdateProduct(Product product)
        {
            try
            {
                _logger.LogInformation($"Updating product with ID: {product.Id}.");
                if (!string.IsNullOrEmpty(product.LogoPath)) {
                    product.LogoPath = _commonService.SaveImage(product.LogoPath);
                }
                _productRepository.UpdateProduct(product);
                productCache.ClearCache(AppSettingKeys.RedisKey);
                _logger.LogInformation("Product updated successfully.");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while updating product with ID: {product.Id}.");
                throw;
            }
        }

        public List<Product> GetProductsByManufacturerId(int manufacturerId)
        {
            try
            {
                _logger.LogInformation($"Retrieving product with Manufacturer ID: {manufacturerId}.");
                var product = _productRepository.GetProductsByManufacturerId(manufacturerId);
                if (product == null)
                {
                    _logger.LogWarning($"Product with Manufacturer ID: {manufacturerId} not found.");
                }
                else
                {
                    _logger.LogInformation("Product retrieved successfully.");
                }
                return product;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while retrieving product with Manufacturer ID: {manufacturerId}.");
                throw;
            }
            
        }
    }
}
