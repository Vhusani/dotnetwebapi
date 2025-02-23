using Dapper;
using System.Data;
using WebAPI.Data;
using WebAPI.Models;

namespace WebAPI.Services.Account
{
    public class AccountService: IAccountService
    {
        public IDatabaseConnectionFactory ConnectionFactory { get; }
        public AccountService(IDatabaseConnectionFactory connection)
        {
            ConnectionFactory = connection;
        }

        public async Task<IEnumerable<UsersDTO>> GetUserByEmail(string Email)
        {
            DynamicParameters dp = new DynamicParameters();
            IDbConnection connection = ConnectionFactory.GetThemLive();
            dp.Add("p_email", Email);
            var result = await connection.QueryAsync<UsersDTO>("sp_getuser",
                dp,
                commandType: CommandType.StoredProcedure,
                commandTimeout: int.MaxValue);

            return result;
        }
    }
}
