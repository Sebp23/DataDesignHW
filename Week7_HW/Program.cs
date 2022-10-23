using Week7_HW;

//It should be noted that this assignment reuses code from Week6HW

//Make the parser and the engine with the requested table names
Parser parser = new Parser();
Engine sqlEngine = new Engine("[dbo].[Character]", "[dbo].[Character_Traits]");

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
    sqlEngine.FindSwordNonHuman();
}

//Report all the errors
Error.ReportErrors();
