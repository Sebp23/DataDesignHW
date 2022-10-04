using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace StructuredFileParser.Entities.JSON
{
    /// <summary>
    /// Class for the nested phone number objects in the JSON file
    /// </summary>
    internal class PhoneNumber
    {
        [JsonPropertyName("type")]
        public string Type { get; set; }

        [JsonPropertyName("number")]
        public string Number { get; set; }

        [JsonPropertyName("canContact")]
        public bool CanContact { get; set; }
    }
}
