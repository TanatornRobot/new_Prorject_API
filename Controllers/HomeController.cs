using Microsoft.AspNetCore.Mvc;

namespace new_Prorject_API.Controllers
{
    [Route("/")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok("🎉 API is running. Try /api/products");
        }
    }
}
