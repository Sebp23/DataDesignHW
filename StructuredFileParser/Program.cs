using StructuredFileParser;
// See https://aka.ms/new-console-template for more information

//Create a list of the names of the files that need to be parsed/processed (Make sure they are in the "Files" directory)
List<string> files = new List<string>() {"SampleCSV.csv", "SamplePipe.txt" };

//Create the parser object
Parser parser = new Parser(files);