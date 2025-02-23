using Dapper;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using WebAPI.Data;
using WebAPI.Models;
using WebAPI.Services.Guids;

namespace WebAPI.Services.Order
{
    public class OrderService: IOrderService
    {
        public IDatabaseConnectionFactory ConnectionFactory { get; }
        public IGuidFactory Guid { get; }


        public OrderService(IDatabaseConnectionFactory connection, IGuidFactory guidFactory) 
        {  
            ConnectionFactory = connection;
            Guid = guidFactory;
        }

        public async Task<IEnumerable<OrderDetails>> GetOrderDetails(string OrderNumber)
        {
            DynamicParameters dp = new DynamicParameters();
            dp.Add("p_OrderNo", OrderNumber);
            IDbConnection connection = ConnectionFactory.GetThemLive();
            var SqlQuery = "SELECT DISTINCT * FROM OrderDetails WHERE OrderNumber = @p_OrderNo";
            var result = await connection.QueryAsync<OrderDetails>(SqlQuery, dp,
                commandType: CommandType.Text,
                commandTimeout: int.MaxValue);

            return result;
        }

        public async Task<IEnumerable<OrderNotes>> GetOrderNotes(string OrderId)
        {
            DynamicParameters dp = new DynamicParameters();
            dp.Add("p_OrderId", OrderId);
            IDbConnection connection = ConnectionFactory.GetThemLive();
            var SqlQuery = "SELECT DISTINCT * FROM OrderNotes WHERE OrderId = @p_OrderId ORDER BY CreatedAt DESC";
            var result = await connection.QueryAsync<OrderNotes>(SqlQuery, dp,
                commandType: CommandType.Text,
                commandTimeout: int.MaxValue);

            return result;
        }

    }
}
