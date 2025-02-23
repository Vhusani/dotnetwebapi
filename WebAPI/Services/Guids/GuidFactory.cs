using System;

namespace WebAPI.Services.Guids
{
    public class GuidFactory : IGuidFactory
    {
        private Guid generatedGuid;

        public Guid GenerateGuid()
        {
            return Guid.NewGuid();
        }
    }
}
    