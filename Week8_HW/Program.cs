using Week8_HW;

//It should be noted that this assignment reuses code from Week6HW

//Make the parser and the engine with the requested table names
Parser parser = new Parser();
Engine sqlEngine = new Engine("Character", "Character_Types", "Character_Maps", "Character_Info", "vw_FullReport_Character");

//Get the details of the file that we want to put through the engine (delimiter, path, name)
var fileToProcess = parser.PrepareFileForEngine();

if (fileToProcess != null)
{
    //Insert into the tables
    sqlEngine.InsertIntoTables(fileToProcess);

    //Get the report of the inner join
    sqlEngine.InnerJoinReport();

    //Find all the characters where their map_location field is null
    sqlEngine.FindCharactersWithNoMap();

    //Find all the characters who aren't human and can fight with swords
    sqlEngine.FindNonTypeSwordFighters("Human");

    //Get the string of concatenated binary values based on the bool values of the Info columns
    sqlEngine.FindConcatenatedBinaryValues();
}

//Report all the errors
Error.ReportErrors();
