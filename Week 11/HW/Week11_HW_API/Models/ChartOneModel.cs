using Newtonsoft.Json;

namespace Week11_HW_API.Models
{
    public class ChartOneModel
    {
        [JsonProperty("Location")]
        public string Location { get; set; }

        [JsonProperty("Monster_Count")]
        public int Monster_Count { get; set; }
    }
}
