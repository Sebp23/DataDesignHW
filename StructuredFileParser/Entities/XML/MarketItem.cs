using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace StructuredFileParser.Entities.XML
{
    /// <summary>
    /// Class for the nested (item) object that is going to be deserialized from the XML file
    /// </summary>
    [XmlRoot("item")]
    public class MarketItem
    {
        [XmlElement("name")]
        public string Name { get; set; }

        [XmlElement("price")]
        public string Price { get; set; }

        [XmlElement("uom")]
        public string UnitOfMeasurement { get; set; }
    }
}
