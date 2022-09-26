using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week3_HW
{
    internal class DoublyList
    {
        public string Info { get; set; }
        public bool IsHead { get; set; }
        public bool IsTail { get; set; }

        public DoublyList? Next { get; set; }
        public DoublyList? Previous { get; set; }

        public DoublyList(string info, bool isHead, bool isTail)
        {
            Info = info;
            IsHead = isHead;
            IsTail = isTail;
        }
    }
}
