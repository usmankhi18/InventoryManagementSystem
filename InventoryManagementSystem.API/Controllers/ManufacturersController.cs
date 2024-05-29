using InventoryManagement.Application.Interfaces;
using InventoryManagement.Domain.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace InventoryManagementSystem.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ManufacturersController : ControllerBase
    {
        private readonly IManufacturerService _manufacturerService;
        private readonly ILogger<ManufacturersController> _logger;

        public ManufacturersController(IManufacturerService manufacturerService, ILogger<ManufacturersController> logger)
        {
            _manufacturerService = manufacturerService;
            _logger = logger;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult GetAllManufacturers()
        {
            try
            {
                _logger.LogInformation("Getting all manufacturers");
                var manufacturers = _manufacturerService.GetAllManufacturers();
                return Ok(manufacturers);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting all manufacturers");
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult GetManufacturerById(int id)
        {
            try
            {
                _logger.LogInformation($"Getting manufacturer with ID: {id}");
                var manufacturer = _manufacturerService.GetManufacturerById(id);
                if (manufacturer == null)
                {
                    _logger.LogWarning($"Manufacturer with ID: {id} not found");
                    return NotFound();
                }
                return Ok(manufacturer);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while getting manufacturer with ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult CreateManufacturer([FromBody] Manufacturer manufacturer)
        {
            if (manufacturer == null)
            {
                _logger.LogWarning("CreateManufacturer: Manufacturer object is null");
                return BadRequest("Manufacturer object is null");
            }

            if (!ModelState.IsValid)
            {
                _logger.LogWarning("CreateManufacturer: Invalid model state for the Manufacturer object");
                return BadRequest("Invalid model state for the Manufacturer object");
            }

            try
            {
                _manufacturerService.AddManufacturer(manufacturer);
                return CreatedAtAction(nameof(GetManufacturerById), new { id = manufacturer.Id }, manufacturer);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while creating a new manufacturer");
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult UpdateManufacturer(int id, [FromBody] Manufacturer manufacturer)
        {
            if (manufacturer == null || manufacturer.Id != id)
            {
                _logger.LogWarning("UpdateManufacturer: Invalid manufacturer object or ID mismatch");
                return BadRequest("Invalid manufacturer object or ID mismatch");
            }

            if (!ModelState.IsValid)
            {
                _logger.LogWarning("UpdateManufacturer: Invalid model state for the Manufacturer object");
                return BadRequest("Invalid model state for the Manufacturer object");
            }

            try
            {
                var dbManufacturer = _manufacturerService.GetManufacturerById(id);
                if (dbManufacturer == null)
                {
                    _logger.LogWarning($"UpdateManufacturer: Manufacturer with ID: {id} not found");
                    return NotFound();
                }

                _manufacturerService.UpdateManufacturer(manufacturer);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while updating manufacturer with ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult DeleteManufacturer(int id)
        {
            try
            {
                var manufacturer = _manufacturerService.GetManufacturerById(id);
                if (manufacturer == null)
                {
                    _logger.LogWarning($"DeleteManufacturer: Manufacturer with ID: {id} not found");
                    return NotFound();
                }

                _manufacturerService.DeleteManufacturer(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error occurred while deleting manufacturer with ID: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }
    }
}
