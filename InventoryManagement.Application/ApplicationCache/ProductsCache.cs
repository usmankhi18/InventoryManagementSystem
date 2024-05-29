using Common.Cache;
using InventoryManagement.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryManagement.Application.ApplicationCache
{
    public class ProductsCache
    {
        private readonly RedisCacheManager _cacheManager;

        public ProductsCache(RedisCacheManager cacheManager)
        {
            _cacheManager = cacheManager;
        }

        public void SaveProductsToCache(string key, List<Product> products, TimeSpan? expirationTime = null)
        {
            _cacheManager.SaveDataToCache(key, products, expirationTime);
        }

        public List<Product> GetProductsFromCache(string key)
        {
            return _cacheManager.GetDataFromCache<List<Product>>(key);
        }

        public void ClearCache(string key)
        {
            _cacheManager.ClearCache(key);
        }
    }
}
