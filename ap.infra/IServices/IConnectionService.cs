namespace ap.infra.IServices
{
    public interface IConnectionService
    {
        string GetConnection(string connectionName = "DefaultConnection");
    }
}
