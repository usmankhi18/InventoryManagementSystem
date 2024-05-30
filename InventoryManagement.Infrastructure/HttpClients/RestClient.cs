using InventoryManagement.Domain.Interfaces;
using InventoryManagement.Infrastructure.Configurations;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace InventoryManagement.Infrastructure.HttpClients
{
	public class RestClient : IRestClient
	{
		private readonly HttpClient _httpClient;
		private readonly ServiceUrls _serviceUrls;
		private readonly ServiceHeaders _serviceHeaders;

		public RestClient(HttpClient httpClient, IOptions<ServiceUrls> serviceUrls, IOptions<ServiceHeaders> serviceHeaders)
		{
			_httpClient = httpClient;
			_serviceUrls = serviceUrls.Value;
			_serviceHeaders = serviceHeaders.Value;

			// Set headers
			foreach (var header in _serviceHeaders.RestHeaders)
			{
				_httpClient.DefaultRequestHeaders.Add(header.Key, header.Value);
			}
		}

		public async Task<T> GetAsync<T>(string uri)
		{
			var response = await _httpClient.GetAsync($"{_serviceUrls.RestServiceBaseUrl}/{uri}");
			response.EnsureSuccessStatusCode();
			var content = await response.Content.ReadAsStringAsync();
			return JsonSerializer.Deserialize<T>(content);
		}

		public async Task<T> PostAsync<T>(string uri, object data)
		{
			var content = new StringContent(JsonSerializer.Serialize(data), Encoding.UTF8, "application/json");
			var response = await _httpClient.PostAsync($"{_serviceUrls.RestServiceBaseUrl}/{uri}", content);
			response.EnsureSuccessStatusCode();
			var responseContent = await response.Content.ReadAsStringAsync();
			return JsonSerializer.Deserialize<T>(responseContent);
		}

		public async Task<T> PutAsync<T>(string uri, object data)
		{
			var content = new StringContent(JsonSerializer.Serialize(data), Encoding.UTF8, "application/json");
			var response = await _httpClient.PutAsync($"{_serviceUrls.RestServiceBaseUrl}/{uri}", content);
			response.EnsureSuccessStatusCode();
			var responseContent = await response.Content.ReadAsStringAsync();
			return JsonSerializer.Deserialize<T>(responseContent);
		}

		public async Task DeleteAsync(string uri)
		{
			var response = await _httpClient.DeleteAsync($"{_serviceUrls.RestServiceBaseUrl}/{uri}");
			response.EnsureSuccessStatusCode();
		}
	}
}
