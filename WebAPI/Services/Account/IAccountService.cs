using WebAPI.Models;

namespace WebAPI.Services.Account
{
    public interface IAccountService
    {
        public Task<IEnumerable<UsersDTO>> GetUserByEmail(string Email);

    }
}
