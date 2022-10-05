using Newtonsoft.Json;
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
        [JsonProperty("firstName")]
        public string FirstName { get; set; }

        [JsonProperty("lastName")]
        public string LastName { get; set; }

        [JsonProperty("isEnrolled")]
        public bool IsEnrolled { get; set; }

        [JsonProperty("yearsEnrolled")]
        public int YearsEnrolled { get; set; }

        [JsonProperty("address1")]
        public Address FirstAddress { get; set; }

        [JsonProperty("address2")]
        public Address? SecondAddress { get; set; }

        [JsonProperty("phoneNumbers")]
        public List<PhoneNumber> PhoneNumbers { get; set; }

    }
}
