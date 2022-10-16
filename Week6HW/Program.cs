using Week6HW;

//It should be noted that I have reused code from Week4_HW and my StructuredFileParser

//create the parser and the engine (specify the name of the table)
Parser parser = new Parser();
Engine sqlEngine = new Engine("[dbo].[Produce-Table]");

//Get the file that will be processed
var fileToProcess = parser.PrepareFileForEngine("Produce.txt");

if (fileToProcess != null)
{
    //insert into the table
    sqlEngine.InsertIntoTable(fileToProcess);

    //Update the location
    sqlEngine.UpdateLocation();

    //Delete expired items
    sqlEngine.DeleteExpired();

    //Increase the price of every item
    sqlEngine.IncreasePrice(1);

    //Export the updated/modified table into an output file
    sqlEngine.ExportFromTable(fileToProcess.SourcePath);

    Console.WriteLine("File Processed Successfully!");
}

//Report any errors during the process
Error.ReportErrors();
