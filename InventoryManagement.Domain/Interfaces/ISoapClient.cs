using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryManagement.Domain.Interfaces
{
	public interface ISoapClient
	{
		Task<T> CallAsync<T>(string action, object request);
	}
}
