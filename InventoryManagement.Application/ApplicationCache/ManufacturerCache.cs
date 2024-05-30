using Common.Cache;
using InventoryManagement.Domain.Models;

namespace InventoryManagement.Application.ApplicationCache
{
    public class ManufacturerCache
    {
        private readonly RedisCacheManager _cacheManager;

        public ManufacturerCache(RedisCacheManager cacheManager)
        {
            _cacheManager = cacheManager;
        }

        public void SaveManufacturersToCache(string key, List<Manufacturer> manufacturers, TimeSpan? expirationTime = null)
        {
            _cacheManager.SaveDataToCache(key, manufacturers, expirationTime);
        }

        public List<Manufacturer> GetManufacturersFromCache(string key)
        {
            return _cacheManager.GetDataFromCache<List<Manufacturer>>(key);
        }

        public void ClearCache(string key)
        {
            _cacheManager.DeleteKeyAsync(key);
        }
    }
}
