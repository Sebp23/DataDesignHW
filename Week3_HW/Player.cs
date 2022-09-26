using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week3_HW
{
    internal class Player
    {
        public string Name { get; set; }
        public int HP { get; set; }
        public int MP { get; set; }
        public int AP { get; set; }
        public int Def { get; set; }

        //Create a random player with random stats
        public Player()
        {
            Name = "Player One";
            Random rand = new Random();
            HP = 200;
            MP = rand.Next(50, 70);
            AP = rand.Next(50, 70);
            Def = rand.Next(95, 110);
        }
    }
}
