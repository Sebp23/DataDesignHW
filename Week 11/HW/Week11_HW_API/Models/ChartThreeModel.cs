using System.Text.Json.Serialization;

namespace Week11_HW_API.Models
{
    public class ChartThreeModel
    {
        [JsonPropertyName("HP")]
        public int? HP { get; set; }

        [JsonPropertyName("MP")]
        public int? MP { get; set; }
    }
}
