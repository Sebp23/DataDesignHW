using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Week3_HW
{
    internal static class Importer
    {
        public static List<Monster> RunImport()
        {
            List<Monster> monsters = new List<Monster>();

            //MAKE SURE THE STATS FILE IS IN THE bin DIRECTORY OF THIS PROJECT FOR THIS TO WORK
            string myFile = $@"{Directory.GetParent(Directory.GetCurrentDirectory()).Parent.FullName}\Stats.txt";

            //Using StreamReader, add all the monsters with stats to a list that is returned
            using (StreamReader sr = new StreamReader(myFile))
            {
                string line;
                while ((line = sr.ReadLine()) != null)
                {
                    //This makes sure that the top row (the labels) doesn't get imported
                    if (line.Contains(' '))
                    {
                        var stats = line.Split(' ');

                        string name = stats[0];
                        int hp = Int32.Parse(stats[1]);
                        int mp = Int32.Parse(stats[2]);
                        int ap = Int32.Parse(stats[3]);
                        int def = Int32.Parse(stats[4]);

                        Monster monster = new Monster(name, hp, ap, def, mp);
                        monsters.Add(monster);
                    }
                    else
                    {
                        continue;
                    }
                }

                sr.Close();
            }

            return monsters;
        }
    }
}
