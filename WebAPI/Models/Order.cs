namespace WebAPI.Models
{

    public class OrderDetails
    {
        public string OrderId { get; set; } = string.Empty;
        public string ProductId { get; set; } = string.Empty;
        public string OrderNumber { get; set; } = string.Empty;
        public int Quantity { get; set; }
        public decimal Price { get; set; }
    }

    public class OrderNotes
    {
        public string? OrderNoteId { get; set; }
        public string? OrderId { get; set; }
        public string? OrderNumber { get; set; }
        public string? ActionPerformed { get; set; }
        public DateTime CreatedAt { get; set; }
    }


}
