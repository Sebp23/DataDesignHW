using Microsoft.AspNetCore.Mvc;
using Week11_HW_API.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Week11_HW_API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ChartController : ControllerBase
    {
        Services service = new Services();

        // GET: api/<ChartController>
        [HttpGet("get-chart-one")]
        public IEnumerable<ChartOneModel> GetChartOne()
        {
            service.PrepareDBConnection();
            
            List<ChartOneModel> modelList = service.GetChartOne();

            return modelList;
        }

        // GET api/<ChartController>/5
        [HttpGet("get-chart-two")]
        public IEnumerable<ChartTwoModel> GetChartTwo()
        {
            service.PrepareDBConnection();

            List<ChartTwoModel> modelList = service.GetChartTwo();

            return modelList;
        }

        [HttpGet("get-chart-three")]
        public IEnumerable<ChartThreeModel> GetChartThree()
        {
            service.PrepareDBConnection();

            List<ChartThreeModel> modelList = service.GetChartThree();

            return modelList;
        }
    }
}
