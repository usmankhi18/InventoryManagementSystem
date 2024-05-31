using System.Net;

namespace InventoryManagement.Tests
{
    public class Tests
    {

		private readonly HttpClient _client;

		public Tests()
		{
			// Initialize HttpClient with your API base address
			_client = new HttpClient();
			_client.BaseAddress = new Uri("https://your-api-base-url.com");
		}

		[Test]
		public async Task GetAllManufacturers_ReturnsSuccess()
		{
			// Arrange
			var response = await _client.GetAsync("/api/Manufacturers");

			// Act & Assert
			response.EnsureSuccessStatusCode();
			Assert.AreEqual(HttpStatusCode.OK, response.StatusCode);
		}
	}
}