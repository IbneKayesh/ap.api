namespace ap.infra.IServices.Users
{
    public interface IUsersService : IGenericService
    {
        dynamic GetByEmailPassword(Dictionary<string, object> parameters);
        dynamic StoreRefreshToken(Dictionary<string, object> parameters);
        dynamic GetUserByRefreshToken(Dictionary<string, object> parameters);

        dynamic ChangePassword(Dictionary<string, object> parameters);
        dynamic ResetPassword(Dictionary<string, object> parameters);
    }
}
