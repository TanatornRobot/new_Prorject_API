using Microsoft.EntityFrameworkCore;
using new_Prorject_API.Models;

namespace new_Prorject_API.Data
{
    public class ApplicationDbcontext
    {
        public class ApplicationDbContext : DbContext
        {
            public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

            public DbSet<Product> pesonaldata2 { get; set; }
        }
    }
}
