namespace WebAPI.Models
{
    public class UsersDTO
    {
        public string UserId { get; set; } = string.Empty;
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public string DOB { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string PhoneCode { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public int RoleId { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Today;
        public string Gender { get; set; } = string.Empty;
        public bool Newsletter { get; set; }
        public string AlterToken { get; set; } = string.Empty;
    }

}
