using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebAPI.Models;
using WebAPI.Services.Order;

namespace WebAPI.Controllers
{
    [Route("order/")]
    [Authorize]
    public class OrderController : Controller
    {

        private IOrderService orderservice { get; }

        public OrderController(IOrderService _orderservice) 
        { 
            orderservice = _orderservice;

        }

        [HttpGet]
        [Route("get/details/{OrderNumber}")]
        public async Task<ActionResult<OrderDetails>> GetOrderDetails(string OrderNumber)
        {
            try
            {
                var result = await orderservice.GetOrderDetails(OrderNumber);

                if (!(result is null))
                {
                    return Ok(result);
                }
                else {
                    return BadRequest("Failed to get order details");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpGet]
        [Route("get/notes/{OrderId}")]
        public async Task<ActionResult<List<OrderNotes>>> GetOrderNotes(string OrderId)
        {
            try
            {
                var result = await orderservice.GetOrderNotes(OrderId);

                if (!(result is null))
                {
                    return Ok(result);
                }
                else
                {
                    return BadRequest("Failed to get orders");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
