using StructuredFileParser;
// See https://aka.ms/new-console-template for more information

Parser parser = new Parser();
parser.SendFilesToEngine();
Error.ReportErrors();