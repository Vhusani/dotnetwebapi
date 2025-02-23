using WebAPI.Models;

namespace WebAPI.Services.User
{
    public interface IUserService
    {
        Task<IEnumerable<UsersDTO>> GetAllUsers();
        Task<dynamic?> GetUserById(string UserId);
    }
}
