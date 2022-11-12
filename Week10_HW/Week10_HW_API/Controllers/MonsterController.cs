using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Week10_HW_API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class MonsterController : ControllerBase
    {
        //Make an instance of the service class (basically a DAL)
        Services service = new Services();

        // GET: api/<MonsterController>
        [HttpGet("get-all")]
        public IEnumerable<MonsterModel> Get()
        {
            service.PrepareDBConnection();

            List<MonsterModel> monsterRecords = service.GetAllFromTable();

            return monsterRecords;
        }

        // GET api/<MonsterController>/5
        [HttpGet("get-monster/{id}")]
        public MonsterModel Get(int id)
        {
            service.PrepareDBConnection();

            MonsterModel monster = service.GetRecordByID(id);

            return monster;
        }

        // POST api/<MonsterController>
        [HttpPost("update-monster")]
        public void Post([FromBody] MonsterModel model)
        {
            service.PrepareDBConnection();

            service.UpdateMonsterByID(model);
        }

        // DELETE api/<MonsterController>/5
        [HttpDelete("delete-monster/{id}")]
        public void Delete(int id)
        {
            service.PrepareDBConnection();

            service.DeleteMonsterByID(id);
        }
    }
}
