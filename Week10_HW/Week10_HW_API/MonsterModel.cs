using System.Text.Json.Serialization;

namespace Week10_HW_API
{
    public class MonsterModel
    {
        [JsonPropertyName("id")]
        public int ID { get; set; }

        [JsonPropertyName("Name")]
        public string? Name { get; set; }

        [JsonPropertyName("Type")]
        public string? Type { get; set; }

        [JsonPropertyName("HP")]
        public int? HP { get; set; }

        [JsonPropertyName("MP")]
        public int? MP { get; set; }

        [JsonPropertyName("Location")]
        public string? Location { get; set; }
    }
}
