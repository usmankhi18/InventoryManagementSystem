using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryManagement.Domain.Interfaces
{
	public interface IRestClient
	{
		Task<T> GetAsync<T>(string uri);
		Task<T> PostAsync<T>(string uri, object data);
		Task<T> PutAsync<T>(string uri, object data);
		Task DeleteAsync(string uri);
	}
}
