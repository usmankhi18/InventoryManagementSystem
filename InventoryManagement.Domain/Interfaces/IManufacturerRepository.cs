using InventoryManagement.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryManagement.Domain.Interfaces
{
    public interface IManufacturerRepository
    {
        Manufacturer GetManufacturer(int manufacturerId);
        List<Manufacturer> GetAllManufacturers();
        bool InsertManufacturers(Manufacturer manufacturer);
        bool UpdateManufacturer(Manufacturer entity);
        bool DeleteManufacturer(Manufacturer entity);
    }
}
