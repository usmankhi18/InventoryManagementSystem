using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryManagement.Infrastructure.Configurations
{
	public class ServiceHeaders
	{
		public Dictionary<string, string> RestHeaders { get; set; }
		public Dictionary<string, string> SoapHeaders { get; set; }
	}
}
