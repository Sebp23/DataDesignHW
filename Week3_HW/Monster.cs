using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week3_HW
{
    internal class Monster
    {
        public string Name { get; set; }
        public int HP { get; set; }
        public int MP { get; set; }
        public int AP { get; set; }
        public int Def { get; set; }    

        public Monster(string name, int health, int atk, int def, int mP)
        {
            Name = name;
            HP = health;
            AP = atk;
            Def = def;
            MP = mP;
        }
    }
}
