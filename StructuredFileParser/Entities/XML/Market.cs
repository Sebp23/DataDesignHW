using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace StructuredFileParser.Entities.XML
{
    /// <summary>
    /// Class for the root object that is going to be deserialized from the XML file
    /// </summary>
    [XmlRoot("menu")]
    public class Market
    {
        [XmlElement("item")]
        public List<MarketItem> Items { get; set; }
    }
}
