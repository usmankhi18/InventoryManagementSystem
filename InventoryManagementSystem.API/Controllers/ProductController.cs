using InventoryManagement.Application.Interfaces;
using InventoryManagement.Domain.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;

namespace InventoryManagementSystem.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductService _productService;
        private readonly ILogger<ProductController> _logger;

        public ProductController(IProductService productService, ILogger<ProductController> logger)
        {
            _productService = productService;
            _logger = logger;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult GetAllProducts()
        {
            try
            {
                _logger.LogInformation("Getting all products");
                var products = _productService.GetAllProducts();
                return Ok(products);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all products");
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult GetProductById(int id)
        {
            try
            {
                _logger.LogInformation($"Getting product with ID: {id}");
                var product = _productService.GetProductById(id);
                if (product == null)
                {
                    _logger.LogWarning($"Product with ID: {id} not found");
                    return NotFound();
                }
                return Ok(product);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while getting product with ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult CreateProduct([FromBody] Product product)
        {
            if (product == null)
            {
                _logger.LogWarning("CreateProduct: Product object is null");
                return BadRequest("Product object is null");
            }

            if (!ModelState.IsValid)
            {
                _logger.LogWarning("CreateProduct: Invalid model state for the Product object");
                return BadRequest("Invalid model state for the Product object");
            }

            try
            {
                _productService.AddProduct(product);
                return CreatedAtAction(nameof(GetProductById), new { id = product.Id }, product);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating a new product");
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult UpdateProduct(int id, [FromBody] Product product)
        {
            if (product == null || product.Id != id)
            {
                _logger.LogWarning("UpdateProduct: Invalid product object or ID mismatch");
                return BadRequest("Invalid product object or ID mismatch");
            }

            if (!ModelState.IsValid)
            {
                _logger.LogWarning("UpdateProduct: Invalid model state for the Product object");
                return BadRequest("Invalid model state for the Product object");
            }

            try
            {
                var dbProduct = _productService.GetProductById(id);
                if (dbProduct == null)
                {
                    _logger.LogWarning($"UpdateProduct: Product with ID: {id} not found");
                    return NotFound();
                }

                _productService.UpdateProduct(product);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while updating product with ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult DeleteProduct(int id)
        {
            try
            {
                var product = _productService.GetProductById(id);
                if (product == null)
                {
                    _logger.LogWarning($"DeleteProduct: Product with ID: {id} not found");
                    return NotFound();
                }

                _productService.DeleteProduct(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while deleting product with ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [HttpGet("ByManufacturer/{manufacturerId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult GetProductsByManufacturerId(int manufacturerId)
        {
            try
            {
                _logger.LogInformation($"Getting products for manufacturer with ID: {manufacturerId}");
                IEnumerable<Product> products = _productService.GetProductsByManufacturerId(manufacturerId);
                if (products == null)
                {
                    _logger.LogWarning($"No products found for manufacturer with ID: {manufacturerId}");
                    return NotFound();
                }
                return Ok(products);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while getting products for manufacturer with ID: {manufacturerId}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }
    }
}