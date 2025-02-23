using Dapper;
using Microsoft.AspNetCore.Connections;
using System.Data;
using WebAPI.Data;
using WebAPI.Models;

namespace WebAPI.Services.User
{
    public class UserService : IUserService
    {
        public IDatabaseConnectionFactory ConnectionFactory { get; }
        public UserService(IDatabaseConnectionFactory connection) 
        {
            ConnectionFactory = connection;
        }

        public async Task<IEnumerable<UsersDTO>> GetAllUsers()
        {
            using IDbConnection connection = ConnectionFactory.GetThemLive();
            var result = await connection.QueryAsync<UsersDTO>("sp_getusers",
                commandType: CommandType.StoredProcedure,
                commandTimeout: int.MaxValue);

            return result;
        }

        public async Task<dynamic?> GetUserById(string UserId)
        {
            DynamicParameters dp = new DynamicParameters();
            IDbConnection connection = ConnectionFactory.GetThemLive();
            dp.Add("p_user_id ", UserId);
            var result = await connection.QueryFirstOrDefaultAsync<UsersDTO>("sp_getuserbyid", dp,
                commandType: CommandType.StoredProcedure,
                commandTimeout: int.MaxValue
                );

            return result;
        }
    }
}
