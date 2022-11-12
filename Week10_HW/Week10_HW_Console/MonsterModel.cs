using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Week10_HW_Console
{
    internal class MonsterModel
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
