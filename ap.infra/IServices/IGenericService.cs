namespace ap.infra.IServices
{
    public interface IGenericService
    {
        dynamic Add(Dictionary<string, object> parameters);
        dynamic Edit(Dictionary<string, object> parameters);
        dynamic AddEdit(Dictionary<string, object> parameters);
        dynamic Delete(Dictionary<string, object> parameters);
        dynamic GetById(Dictionary<string, object> parameters);
        dynamic GetAll(Dictionary<string, object> parameters);
        dynamic GetAllActive(Dictionary<string, object> parameters);
    }
}
