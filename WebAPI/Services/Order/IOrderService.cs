using WebAPI.Models;

namespace WebAPI.Services.Order
{
    public interface IOrderService
    {
        Task<IEnumerable<OrderDetails>> GetOrderDetails(string OrderNumber);
        Task<IEnumerable<OrderNotes>> GetOrderNotes(string OrderId);
    }
}
