using Microsoft.EntityFrameworkCore;
using MetalUniverse.Models;

namespace MetalUniverse.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Product> Products { get; set; }
        // Add other DbSets for additional entities.
    }
}

