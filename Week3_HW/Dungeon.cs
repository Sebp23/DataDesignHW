using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week3_HW
{
    internal class DungeonRoom
    {
        public int Level { get; set; }
        public Monster Monster { get; set; }
        public bool IsComplete { get; set; }
        public string Info { get; set; }

        public DungeonRoom(int level, Monster monster, bool isComplete = false)
        {
            Level = level;
            Monster = monster;
            IsComplete = isComplete;
        }

        //player fights the monster
        //I know it's not the most exciting but it works
        public bool Fight(Player player, Monster monster)
        {
            bool playerWin;

            if (player.AP > monster.Def)
            {
                monster.HP -= player.AP;
            }
            else if (player.MP > monster.Def)
            {
                monster.HP -= player.MP;
            }

            if (player.Def < monster.AP)
            {
                player.HP -= monster.AP;
            }
            else if (player.Def < monster.MP)
            {
                player.HP -= monster.MP;
            }

            if (monster.HP > 0 && player.HP > 0)
            {
                return playerWin = Fight(player, monster);
            }
            else if (monster.HP <= 0)
            {
                return playerWin = true;
            }
            else
            {
                return playerWin = false;
            }
        }
    }
}
