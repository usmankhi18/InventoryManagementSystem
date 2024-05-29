using InventoryManagement.Application.Interfaces;
using Microsoft.Extensions.Logging;

namespace InventoryManagement.Application
{
    public class CommonService : ICommonService
    {
        private readonly ILogger<CommonService> _logger;

        public CommonService(ILogger<CommonService> logger)
        {
            _logger = logger;
        }

        public string SaveImage(string base64Image)
        {
            try
            {
                // Generate a unique file name
                string fileName = $"{Guid.NewGuid()}.png";
                string folderPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images");

                // Ensure the folder exists
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath = Path.Combine(folderPath, fileName);

                // Convert base64 string to byte array
                byte[] imageBytes = Convert.FromBase64String(base64Image);

                // Save the image to the folder
                File.WriteAllBytes(filePath, imageBytes);

                _logger.LogInformation("Image saved successfully at: {FilePath}", filePath);

                return filePath;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while saving the image.");
                throw; // Re-throw the exception to propagate it to the caller
            }
        }
    }
}