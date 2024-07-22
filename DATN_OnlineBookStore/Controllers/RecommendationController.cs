using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.IO;
using System.Threading.Tasks;

namespace DATN_OnlineBookStore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RecommendationController : ControllerBase
    {
        [HttpGet("user/{userId}/recommendations")]
        public async Task<IActionResult> GetRecommendations(int userId, int n_recommendations = 5)
        {
            string pythonScript = "recommendation_client.py"; // Path to your Python script
            string args = $"{userId} {n_recommendations}";
            ProcessStartInfo start = new ProcessStartInfo();
            start.FileName = "python";
            start.Arguments = $"{pythonScript} {args}";
            start.UseShellExecute = false;
            start.RedirectStandardOutput = true;
            start.RedirectStandardError = true;
            string result = string.Empty;

            using (Process process = Process.Start(start))
            {
                using (StreamReader reader = process.StandardOutput)
                {
                    result = await reader.ReadToEndAsync();
                }
            }

            return Ok(result);
        }
    }
}
