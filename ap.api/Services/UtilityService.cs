using ap.dbc.Model;
using Newtonsoft.Json;
using System.Text.Json;

namespace ap.api.Services
{
    public class UtilityService
    {
        public static Dictionary<string, object> Deserialize(dynamic data)
        {
            return JsonConvert.DeserializeObject<Dictionary<string, object>>(data.ToString());
        }
        public static Dictionary<string, object> Deserialize(string jsonData)
        {
            var jsonDynamic = JsonConvert.DeserializeObject<dynamic>(jsonData.ToString());
            return JsonConvert.DeserializeObject<Dictionary<string, object>>(jsonDynamic.jsonData.ToString());
        }
        public static T Deserialize<T>(string jsonData)
        {
            return JsonConvert.DeserializeObject<T>(jsonData.ToString());
        }
        public static string SerializeObject(string jsonData)
        {
            return JsonConvert.SerializeObject(jsonData);
        }
    }
}
