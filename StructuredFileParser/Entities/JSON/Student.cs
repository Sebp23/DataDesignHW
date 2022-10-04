using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace StructuredFileParser.Entities.JSON
{
    /// <summary>
    /// Class for the object that is going to be deserialized from the JSON file
    /// </summary>
    internal class Student
    {
        [JsonPropertyName("firstName")]
        public string FirstName { get; set; }

        [JsonPropertyName("lastName")]
        public string LastName { get; set; }

        [JsonPropertyName("isEnrolled")]
        public bool IsEnrolled { get; set; }

        [JsonPropertyName("yearsEnrolled")]
        public int YearsEnrolled { get; set; }

        [JsonPropertyName("address1")]
        public Address FirstAddress { get; set; }

        [JsonPropertyName("address2")]
        public Address? SecondAddress { get; set; }

        [JsonPropertyName("phoneNumbers")]
        public List<PhoneNumber> PhoneNumbers { get; set; }

    }
}
