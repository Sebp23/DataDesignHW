using Newtonsoft.Json;

namespace Week11_HW_Forms.Models
{
    public class ChartTwoModel
    {
        [JsonProperty("HP")]
        public int HP { get; set; }

        [JsonProperty("Count")]
        public int Count { get; set; }
    }
}
