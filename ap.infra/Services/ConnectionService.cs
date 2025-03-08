using ap.infra.IServices;
using Microsoft.Extensions.Configuration;

namespace ap.infra.Services
{
    public class ConnectionService : IConnectionService
    {
        private readonly IConfiguration _configuration;

        public ConnectionService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public string GetConnection(string connectionName)
        {
            return _configuration.GetConnectionString(connectionName);
        }
    }
}
