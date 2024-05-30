using InventoryManagement.Domain.Interfaces;
using InventoryManagement.Infrastructure.Configurations;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace InventoryManagement.Infrastructure.HttpClients
{
	public class SoapClient : ISoapClient
	{
		private readonly HttpClient _httpClient;
		private readonly ServiceUrls _serviceUrls;
		private readonly ServiceHeaders _serviceHeaders;

		public SoapClient(HttpClient httpClient, IOptions<ServiceUrls> serviceUrls, IOptions<ServiceHeaders> serviceHeaders)
		{
			_httpClient = httpClient;
			_serviceUrls = serviceUrls.Value;
			_serviceHeaders = serviceHeaders.Value;

			// Set headers
			foreach (var header in _serviceHeaders.SoapHeaders)
			{
				_httpClient.DefaultRequestHeaders.Add(header.Key, header.Value);
			}
		}

		public async Task<T> CallAsync<T>(string action, object request)
		{
			var soapEnvelope = CreateSoapEnvelope(request);
			var httpContent = new StringContent(soapEnvelope, Encoding.UTF8, "text/xml");

			var requestMessage = new HttpRequestMessage(HttpMethod.Post, _serviceUrls.SoapServiceBaseUrl)
			{
				Content = httpContent
			};
			requestMessage.Headers.Add("SOAPAction", action);

			var response = await _httpClient.SendAsync(requestMessage);
			response.EnsureSuccessStatusCode();

			var responseContent = await response.Content.ReadAsStringAsync();
			return Deserialize<T>(responseContent);
		}

		private string CreateSoapEnvelope(object request)
		{
			var xmlSerializer = new XmlSerializer(request.GetType());
			using var stringWriter = new StringWriter();
			xmlSerializer.Serialize(stringWriter, request);
			return stringWriter.ToString();
		}

		private T Deserialize<T>(string xml)
		{
			var xmlSerializer = new XmlSerializer(typeof(T));
			using var stringReader = new StringReader(xml);
			return (T)xmlSerializer.Deserialize(stringReader);
		}
	}
}
