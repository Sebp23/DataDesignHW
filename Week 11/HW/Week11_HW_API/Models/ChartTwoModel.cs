using System.Text.Json.Serialization;

namespace Week11_HW_API.Models
{
    public class ChartTwoModel
    {
        [JsonPropertyName("HP")]
        public int HP { get; set; }

        [JsonPropertyName("Count")]
        public int Count { get; set; }
    }
}
