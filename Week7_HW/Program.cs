using Week7_HW;

Parser parser = new Parser();
Engine sqlEngine = new Engine("[dbo].[Character]");

var fileToProcess = parser.PrepareFileForEngine("Chars.csv");

if (fileToProcess != null)
{
    sqlEngine.InsertIntoTables(fileToProcess);
    sqlEngine.InnerJoinReport(fileToProcess);
    sqlEngine.FindCharactersWithNoMap(fileToProcess);
    sqlEngine.FindSwordNonHuman(fileToProcess);
}

Error.ReportErrors();
