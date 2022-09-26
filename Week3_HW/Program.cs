using Week3_HW;
using System;
// See https://aka.ms/new-console-template for more information

//Get the monsters
List<Monster> monsterList = Importer.RunImport();

//Start the game with the list of monsters from the Stats file
GameService game = new GameService(monsterList);
game.RunGame();
