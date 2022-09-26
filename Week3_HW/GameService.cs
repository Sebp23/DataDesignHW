using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace Week3_HW
{
    internal class GameService
    {
        public List<DungeonRoom> RemainingDungeonRooms { get; set; }
        public List<DungeonRoom> CompletedRooms { get; set; }

        public GameService(List<Monster> monsterList)
        {
            RemainingDungeonRooms = new List<DungeonRoom>();
            CompletedRooms = new List<DungeonRoom>();

            //add dungeon rooms to the list of remaining dungeons
            RemainingDungeonRooms.Add(new DungeonRoom(1, monsterList[0]));
            RemainingDungeonRooms.Add(new DungeonRoom(2, monsterList[1]));
            RemainingDungeonRooms.Add(new DungeonRoom(3, monsterList[2]));
        }

        public void RunGame()
        {
            Player player = new Player(); //Make the player with random stats

            bool isGameFinished = false; //For checking if the game is over
            
            //while the game is running
            while (!isGameFinished)
            {
                isGameFinished = PlayGame(player); //set the bool
            }

            EndGameProcedure(); //Endgame procedure where linked list is made and results are then exported
        }

        /// <summary>
        /// Play the game
        /// </summary>
        /// <param name="player"></param>
        /// <returns></returns>
        private bool PlayGame(Player player)
        {
            //This bool will be used to determine if the game should begin the export process or not
            bool gameIsFinished = false;

            //The room that the player wants to enter
            DungeonRoom selectedRoom = DisplayRooms(this.RemainingDungeonRooms);

            //Check to see if the player survives the room
            if (CheckIfPlayerSurvives(player, selectedRoom) && this.RemainingDungeonRooms.Count > 0) //if they survive
            {
                selectedRoom.IsComplete = true;
                this.RemainingDungeonRooms.Remove(selectedRoom); //Remove this room from the list of remaining rooms
                this.CompletedRooms.Add(selectedRoom); //Add this room to the list of completed rooms

                //If there are still rooms that the player can enter
                if (this.RemainingDungeonRooms.Count > 0)
                {

                    Console.WriteLine($"You survived against the {selectedRoom.Monster.Name}!");
                    Console.WriteLine($"You have rested and healed to full health");
                    Console.WriteLine(this.RemainingDungeonRooms.Count == 1 ? $"There is {this.RemainingDungeonRooms.Count} room remaining" : $"There are {this.RemainingDungeonRooms.Count} rooms remaining");

                    //The game is not over yet
                    return false;
                }
                else if (this.RemainingDungeonRooms.Count <= 0)
                {
                    Console.WriteLine($"You survived against the {selectedRoom.Monster.Name}!");
                    Console.WriteLine("You have survived every room. Well done!");
                }
            }
            else
            {
                Console.WriteLine("YOU DIED");
                //Add the previously room that the player died in to the list of completed rooms
                this.CompletedRooms.Add(selectedRoom);

                //For every remaining room that has no info (since it hasn't been entered)
                foreach (var room in this.RemainingDungeonRooms.Where(room => room.Info == null))
                {
                    room.Info = $"Player did not survive to reach the {room.Monster.Name}'s room...";
                    this.CompletedRooms.Add(room); //Add this room to the list, since it will be used for results printing
                }
            }
            return gameIsFinished = true; //the game is over
        }

        /// <summary>
        /// Create the linked list with the results of each room.
        /// Then begin the export process into the bin folder of the project
        /// </summary>
        private void EndGameProcedure()
        {
            DoublyList roomOneResult = new DoublyList(CompletedRooms[0].Info, true, false);
            DoublyList roomTwoResult = new DoublyList(CompletedRooms[1].Info, false, false);
            DoublyList roomThreeResult = new DoublyList(CompletedRooms[2].Info, false, true);

            roomOneResult.Next = roomTwoResult;
            roomTwoResult.Next = roomThreeResult;
            roomThreeResult.Previous = roomTwoResult;
            roomTwoResult.Previous = roomOneResult;

            Exporter.BeginExport(roomOneResult);
            Console.WriteLine("GAME OVER, results have been exported into the bin directory of this project...");
        }

        /// <summary>
        /// Display the remaining rooms that the player has yet to enter
        /// </summary>
        /// <param name="dungeonRooms"></param>
        /// <returns></returns>
        private DungeonRoom DisplayRooms(List<DungeonRoom> dungeonRooms)
        {
            foreach (var room in dungeonRooms)
            {
                Console.WriteLine($"[{dungeonRooms.IndexOf(room)}] - The {room.Monster.Name}'s room");
            }
            
            return dungeonRooms[GetBoundInt(0, 2, "Please type the number of the room you wish the enter: ")];
        }

        /// <summary>
        /// Player fights the monster
        /// Check to see if they survived and return the boolean
        /// </summary>
        /// <param name="player"></param>
        /// <param name="room"></param>
        /// <returns></returns>
        private bool CheckIfPlayerSurvives(Player player, DungeonRoom room)
        {
            bool playerSurvived = false;

            if (!room.Fight(player, room.Monster))
            {
                string info = $"Player died in room {room.Level} against the {room.Monster.Name}";
                room.Info = info;

                return playerSurvived = false;
            }
            else
            {
                string info = $"Player won in room {room.Level} against the {room.Monster.Name}!";
                room.Info = info;

                return playerSurvived = true;
            }
        }

        /// <summary>
        /// Get the input from the player
        /// </summary>
        /// <param name="prompt"></param>
        /// <returns></returns>
        private string GetStringInput(string prompt = null)
        {
            if (!string.IsNullOrEmpty(prompt))
            {
                Console.WriteLine(prompt);
            }

            return Console.ReadLine();
        }

        /// <summary>
        /// Make sure the input is a number
        /// </summary>
        /// <param name="prompt"></param>
        /// <returns></returns>
        private int GetIntInput(string prompt = null)
        {
            bool acceptableAnswer = false;
            int result = -1;
            while (!acceptableAnswer)
            {
                string answer = GetStringInput(prompt);
                if (int.TryParse(answer, out int number))
                {
                    result = number;
                    acceptableAnswer = true;
                }
                else
                {
                    Console.WriteLine("Please enter a number");
                }
            }

            return result;
        }

        /// <summary>
        /// Make sure the number inputted by the player is within the bounds of the multiple choice questions
        /// </summary>
        /// <param name="min"></param>
        /// <param name="max"></param>
        /// <param name="prompt"></param>
        /// <returns></returns>
        private int GetBoundInt(int min, int max, string prompt = null)
        {
            bool acceptableAnswer = false;
            var num = GetIntInput(prompt);

            while (!acceptableAnswer)
            {
                if (num >= min && num < max)
                {
                    acceptableAnswer = true;
                }
                else
                {
                    Console.WriteLine("Please enter a valid number within the displayed range");
                    num = GetIntInput(prompt);
                }
            }

            return num;
        }
    }
}
