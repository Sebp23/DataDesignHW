using Newtonsoft.Json;

namespace Week11_HW_API.Models
{
    public class ChartThreeModel
    {
        [JsonProperty("HP")]
        public int? HP { get; set; }

        [JsonProperty("MP")]
        public int? MP { get; set; }
    }
}
