using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using WebAPI.Data;
using WebAPI.Models;
using WebAPI.Services.Account;
using WebAPI.Services.JsonWebToken;

namespace WebAPI.Controllers
{
    [Route("account/")]
    [ApiController]
    public class AccountController : Controller
    {
        private IAccountService AccountService { get; }
        private IDatabaseConnectionFactory ConnectionFactory { get; }
        private IJsonWebTokenService JsonWebTokenService { get; }
        
        public AccountController(IAccountService accountservice, IDatabaseConnectionFactory connectionFactory, IJsonWebTokenService jsonWebTokenService)
        {
            AccountService = accountservice;
            ConnectionFactory = connectionFactory;
            JsonWebTokenService = jsonWebTokenService;
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("login")]
        public async Task<ActionResult<Login>> Login([FromBody] Login UserData)
        {
            try
            {
                DynamicParameters dp = new DynamicParameters();
                dp.Add("p_email", UserData.Email);
                IDbConnection connection = ConnectionFactory.GetThemLive();
                var result = await connection.QueryFirstOrDefaultAsync("sp_getuser",
                    dp,
                    commandType: CommandType.StoredProcedure,
                    commandTimeout: int.MaxValue);

                if (!(result is null))
                {
                    var InputPassword = UserData.Password;
                    bool PassMatch = BCrypt.Net.BCrypt.Verify(InputPassword, result?.Password);

                    if (PassMatch)
                    {
                        var UserId = result?.UserId;
                        var jwt = JsonWebTokenService.GetToken(UserId);
                        string token = jwt.Value;

                        if (token is null)
                        {
                           return BadRequest("Failed to generate token");
                        }

                        var response = new { token };
                        return Ok(response);
                    }
                    else
                    {
                        return Unauthorized();
                    }
                }

                else
                {
                    return BadRequest("failed to login");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


    }
}
