using ap.dbc.Execute;
using ap.infra.IServices;
using ap.infra.IServices.Users;

namespace ap.infra.Services.Users
{
    public class UsersService : IUsersService
    {
        private readonly RawSql _rawSql;
        private readonly IConnectionService _connectionService;
        public UsersService(RawSql rawSql, IConnectionService connectionService)
        {
            _rawSql = rawSql;
            _connectionService = connectionService;
        }
        public dynamic Add(Dictionary<string, object> parameters)
        {
            throw new NotImplementedException();
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
            throw new NotImplementedException();
        }

        public dynamic GetAll(Dictionary<string, object> parameters)
        {
            throw new NotImplementedException();
        }

        public dynamic GetAllActive(Dictionary<string, object> parameters)
        {
            throw new NotImplementedException();
        }

        public dynamic GetById(Dictionary<string, object> parameters)
        {
            throw new NotImplementedException();
        }
        public dynamic GetByEmailPassword(Dictionary<string, object> parameters)
        {
            parameters["Action"] = "USER_LOGIN";
            return _rawSql.ExecuteSql_dynamic(_connectionService.GetConnection(), "SP_AP_USERS", "AP_USERS", parameters);
        }
        public dynamic ChangePassword(Dictionary<string, object> parameters)
        {
            parameters["Action"] = "CHANGE_PASSWORD";
            return _rawSql.ExecuteSql_dynamic(_connectionService.GetConnection(), "SP_AP_USERS", "AP_USERS", parameters);
        }

        public dynamic ResetPassword(Dictionary<string, object> parameters)
        {
            parameters["Action"] = "RESET_PASSWORD";
            return _rawSql.ExecuteSql_dynamic(_connectionService.GetConnection(), "SP_AP_USERS", "AP_USERS", parameters);
        }

        public dynamic StoreRefreshToken(Dictionary<string, object> parameters)
        {
            parameters["Action"] = "UPDATE_LOGIN_TOKEN";
            return _rawSql.ExecuteSql_dynamic(_connectionService.GetConnection(), "SP_AP_USERS", "AP_USERS", parameters);
        }

        public dynamic GetUserByRefreshToken(Dictionary<string, object> parameters)
        {
            parameters["Action"] = "GET_LOGIN_TOKEN";
            return _rawSql.ExecuteSql_dynamic(_connectionService.GetConnection(), "SP_AP_USERS", "AP_USERS", parameters);
        }
    }
}
