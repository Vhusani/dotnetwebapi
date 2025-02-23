using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using WebAPI.Data;
using WebAPI.Models;
using WebAPI.Services.Guids;
using WebAPI.Services.User;

namespace WebAPI.Controllers
{
    [Route("user/")]
    [Authorize]
    public class UserController : Controller
    {
        private readonly IConfiguration Configuration;
        public IDatabaseConnectionFactory ConnectionFactory { get; }
        private IGuidFactory Guid { get; }
        private IUserService UserService { get; }

        public UserController(IConfiguration configuration, IDatabaseConnectionFactory connection, IGuidFactory guid, IUserService userService)
        {
            Configuration = configuration;
            ConnectionFactory = connection;
            Guid = guid;
            UserService = userService;
        }

        [HttpGet]
        [Route("get/all")]
        public async Task<ActionResult<List<UsersDTO>>> GetUsers()
        {
            try
            {
                var result = await UserService.GetAllUsers();

                return Ok(result);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("get/byUserId/{UserId}")]
        public async Task<ActionResult> GetUserById(string UserId)
        {
            try
            {
                var result = await UserService.GetUserById(UserId);

                if (!(result is null))
                {
                    return Ok(result);
                }
                else
                {
                    return BadRequest("Failed to get user");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
