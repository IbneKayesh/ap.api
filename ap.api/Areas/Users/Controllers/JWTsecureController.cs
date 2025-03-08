using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ap.api.Areas.Users.Controllers
{
    [Route("api/Users/[controller]")]
    [ApiController]
    [Authorize] // Requires JWT authentication
    public class JWTsecureController : ControllerBase
    {
        [HttpGet("v1/jwt-secure")]
        public IActionResult Get()
        {
            return Ok(new { Message = "This is a secure endpoint!" });
        }
    }
}
