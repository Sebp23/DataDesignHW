using Newtonsoft.Json;

namespace Week11_HW_API.Models
{
    public class ChartTwoModel
    {
        [JsonProperty("HP")]
        public int HP { get; set; }

        [JsonProperty("Count")]
        public int Count { get; set; }
    }
}
