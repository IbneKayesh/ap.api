using ap.api.Services;
using ap.infra.IServices.Settings;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace ap.api.Areas.Settings.Controllers
{
    [Route("api/Settings/[controller]")]
    [ApiController]
    [Authorize] // Requires JWT authentication
    public class RolesController : ControllerBase
    {
        private readonly IRoleService _roleService;
        public RolesController(IRoleService roleService)
        {
            _roleService = roleService;
        }

        [Route("v1/get-all")]
        [HttpPost]
        public IActionResult GetAll([FromBody] dynamic data)
        {
            var parameters = UtilityService.Deserialize(data);
            var resultJson = _roleService.GetAll(parameters);
            return Ok(resultJson);
        }
        [Route("add-edit")]
        [HttpPost]
        public IActionResult AddEdit([FromBody] dynamic data)
        {
            var parameters = JsonConvert.DeserializeObject<Dictionary<string, object>>(data.ToString());
            var resultJson = _roleService.AddEdit(parameters);
            return Ok(resultJson);
        }

        [Route("get-by-id")]
        [HttpPost]
        public IActionResult GetById([FromBody] dynamic data)
        {
            var parameters = JsonConvert.DeserializeObject<Dictionary<string, object>>(data.ToString());
            var resultJson = _roleService.GetById(parameters);
            return Ok(resultJson);
        }

        [Route("delete")]
        [HttpPost]
        public IActionResult Delete ([FromBody] dynamic data)
        {
            var parameters = JsonConvert.DeserializeObject<Dictionary<string, object>>(data.ToString());
            var resultJson = _roleService.Delete(parameters);
            return Ok(resultJson);
        }
    }
}
