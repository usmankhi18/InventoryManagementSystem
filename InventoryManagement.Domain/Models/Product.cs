namespace InventoryManagement.Domain.Models
{
    public class Product
    {
        public int Id { get; set; }
        public int ManufacturerId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public string? LogoPath { get; set; }
    }
}