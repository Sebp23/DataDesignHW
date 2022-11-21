using System.Text.Json.Serialization;

namespace Week11_HW_API.Models
{
    public class ChartOneModel
    {
        [JsonPropertyName("Location")]
        public string Location { get; set; }

        [JsonPropertyName("Monster_Count")]
        public int Monster_Count { get; set; }
    }
}
