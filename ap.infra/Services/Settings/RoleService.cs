using ap.dbc.Execute;
using ap.infra.IServices;
using ap.infra.IServices.Settings;

namespace ap.infra.Services.Settings
{
    public class RoleService : IRoleService
    {
        private readonly RawSql _rawSql;
        private readonly IConnectionService _connectionService;

        public RoleService(RawSql rawSql, IConnectionService connectionService)
        {
            _rawSql = rawSql;
            _connectionService = connectionService;
        }
        public dynamic Add(Dictionary<string, object> parameters)
        {
            parameters["Action"] = "INSERT";
            return _rawSql.ExecuteSql_dynamic(_connectionService.GetConnection(), "SP_AP_ROLES", "AP_ROLES", parameters);
        }

        public dynamic AddEdit(Dictionary<string, object> parameters)
        {
            throw new NotImplementedException();
        }

        public dynamic Delete(Dictionary<string, object> parameters)
        {
            throw new NotImplementedException();
        }

        public dynamic Edit(Dictionary<string, object> parameters)
        {
            parameters["Action"] = "UPDATE";
            return _rawSql.ExecuteSql_dynamic(_connectionService.GetConnection(), "SP_AP_ROLES", "AP_ROLES", parameters);
        }

        public dynamic GetAll(Dictionary<string, object> parameters)
        {
            parameters["Action"] = "GETALL";
            return _rawSql.ExecuteSql_dynamic(_connectionService.GetConnection(), "SP_AP_ROLES", "AP_ROLES", parameters);
        }

        public dynamic GetAllActive(Dictionary<string, object> parameters)
        {
            parameters["Action"] = "GETALLACTIVE";
            return _rawSql.ExecuteSql_dynamic(_connectionService.GetConnection(), "SP_AP_ROLES", "AP_ROLES", parameters);
        }

        public dynamic GetById(Dictionary<string, object> parameters)
        {
            parameters["Action"] = "GETBYID";
            return _rawSql.ExecuteSql_dynamic(_connectionService.GetConnection(), "SP_AP_ROLES", "AP_ROLES", parameters);
        }
    }
}
