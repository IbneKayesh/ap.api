using ap.api.Services;
using ap.dbc.Model;
using ap.dmo.Users.Auth;
using ap.infra.IServices.Users;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace ap.api.Areas.Users.Controllers
{
    [Route("api/Users/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _config;
        private readonly IUsersService _usersService; // Service to validate users
        public AuthController(IConfiguration config, IUsersService usersService)
        {
            _config = config;
            _usersService = usersService;
        }

        [HttpPost("v1/login")]
        public IActionResult Login([FromBody] dynamic data)
        {
            var parameters = UtilityService.Deserialize(data);
            var resultJson = _usersService.GetByEmailPassword(parameters);
            EQResult resultObj = UtilityService.Deserialize<EQResult>(resultJson);
            if (resultObj.SUCCESS)
            {
                var sessionString = JsonConvert.SerializeObject(resultObj.DynamicData);
                USER_SESSION user = UtilityService.Deserialize<List<USER_SESSION>>(sessionString).FirstOrDefault();

                // Generate access token
                var accessToken = GenerateJwtToken(user.ID, user.DEFAULT_ROLE);

                // Generate refresh token
                var refreshToken = GenerateRefreshToken();


                //Store the refresh token (you can store it in a DB for invalidation later)
                var newDataSet = new Dictionary<string, object>()
                            {
                                {"Id", user.ID },
                                {"UserId", user.ID },
                                {"LoginToken",refreshToken },
                            };

                _usersService.StoreRefreshToken(newDataSet);

                return Ok(new
                {
                    accessToken,
                    refreshToken
                });
            }
            else
            {
                return Unauthorized(resultJson);
            }
        }
        private string GenerateJwtToken(string userId, string userRole)
        {
            var jwtSettings = _config.GetSection("JwtSettings");
            var key = Encoding.UTF8.GetBytes(jwtSettings["Key"]);
            var tokenHandler = new JwtSecurityTokenHandler();

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                new Claim(ClaimTypes.Name, userId),
                new Claim(ClaimTypes.Role, userRole) // Modify roles dynamically if needed
            }),
                Expires = DateTime.UtcNow.AddMinutes(Convert.ToDouble(jwtSettings["ExpireMinutes"])),
                Issuer = jwtSettings["Issuer"],
                Audience = jwtSettings["Audience"],
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
        private string GenerateRefreshToken()
        {
            var randomBytes = new byte[64];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(randomBytes);
            }
            return Convert.ToBase64String(randomBytes);
        }


        [HttpPost("v1/refresh-token")]
        public IActionResult RefreshToken([FromBody] dynamic data)
        {
            var parameters = UtilityService.Deserialize(data);
            var user = _usersService.GetUserByRefreshToken(parameters);
            if (user == null)
                return Unauthorized(new { message = "Invalid refresh token" });

            // Generate new JWT and refresh token
            var newAccessToken = GenerateJwtToken(user.ID, user.USER_DEFAULT_ROLE);
            var newRefreshToken = GenerateRefreshToken();

            // Store the new refresh token in the database
            var newDataSet = new Dictionary<string, object>()
                            {
                                {"Id", user.ID },
                                {"UserId", user.ID },
                                {"LoginToken",newRefreshToken },
                            };

            _usersService.StoreRefreshToken(newDataSet);

            return Ok(new
            {
                accessToken = newAccessToken,
                refreshToken = newRefreshToken
            });
        }
    }
}
