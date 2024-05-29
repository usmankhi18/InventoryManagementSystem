using Global.AppSettings;
using InventoryManagement.Application.ApplicationCache;
using InventoryManagement.Application.Interfaces;
using InventoryManagement.Domain.Interfaces;
using InventoryManagement.Domain.Models;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace InventoryManagement.Application
{
    public class ManufacturerService : IManufacturerService
    {
        private readonly IManufacturerRepository _manufacturerRepository;
        private readonly ICommonService _commonService;
        private readonly ILogger<ManufacturerService> _logger;
        private readonly ManufacturerCache manufacturerCache;

        public ManufacturerService(ICommonService commonService ,IManufacturerRepository manufacturerRepository, ILogger<ManufacturerService> logger, ManufacturerCache cache)
        {
            _manufacturerRepository = manufacturerRepository;
            _commonService = commonService;
            _logger = logger;
            manufacturerCache = cache;
        }

        public void AddManufacturer(Manufacturer manufacturer)
        {
            try
            {
                _logger.LogInformation("Adding a new manufacturer.");
                manufacturer.LogoPath = _commonService.SaveImage(manufacturer.LogoPath);
                _manufacturerRepository.InsertManufacturers(manufacturer);
                manufacturerCache.ClearCache(AppSettingKeys.RedisKey);
                _logger.LogInformation("Manufacturer added successfully.");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding a manufacturer.");
                throw;
            }
        }

        public void DeleteManufacturer(int id)
        {
            try
            {
                _logger.LogInformation($"Deleting manufacturer with ID: {id}.");
                var manufacturer = _manufacturerRepository.GetManufacturer(id);
                if (manufacturer == null)
                {
                    _logger.LogWarning($"Manufacturer with ID: {id} not found.");
                    return;
                }
                _manufacturerRepository.DeleteManufacturer(manufacturer);
                manufacturerCache.ClearCache(AppSettingKeys.RedisKey);
                _logger.LogInformation("Manufacturer deleted successfully.");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while deleting manufacturer with ID: {id}.");
                throw;
            }
        }

        public List<Manufacturer> GetAllManufacturers()
        {
            try
            {
                _logger.LogInformation("Retrieving all manufacturers.");
                List<Manufacturer> manufacturers = manufacturerCache.GetManufacturersFromCache(AppSettingKeys.RedisKey);
                if (manufacturers == null)
                {
                    manufacturers = _manufacturerRepository.GetAllManufacturers();
                }
                _logger.LogInformation("Manufacturers retrieved successfully.");
                return manufacturers;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while retrieving all manufacturers.");
                throw;
            }
        }

        public Manufacturer GetManufacturerById(int id)
        {
            try
            {
                _logger.LogInformation($"Retrieving manufacturer with ID: {id}.");
                var manufacturer = _manufacturerRepository.GetManufacturer(id);
                if (manufacturer == null)
                {
                    _logger.LogWarning($"Manufacturer with ID: {id} not found.");
                }
                else
                {
                    _logger.LogInformation("Manufacturer retrieved successfully.");
                }
                return manufacturer;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while retrieving manufacturer with ID: {id}.");
                throw;
            }
        }

        public void UpdateManufacturer(Manufacturer manufacturer)
        {
            try
            {
                _logger.LogInformation($"Updating manufacturer with ID: {manufacturer.Id}.");
                if (!string.IsNullOrEmpty(manufacturer.LogoPath))
                {
                    manufacturer.LogoPath = _commonService.SaveImage(manufacturer.LogoPath);
                }
                _manufacturerRepository.UpdateManufacturer(manufacturer);
                manufacturerCache.ClearCache(AppSettingKeys.RedisKey);
                _logger.LogInformation("Manufacturer updated successfully.");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while updating manufacturer with ID: {manufacturer.Id}.");
                throw;
            }
        }
    }
}