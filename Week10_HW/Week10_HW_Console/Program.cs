using Week10_HW_Console;

Services service = new Services();

service.GetAllMonsters();
service.GetMonster(500);
service.UpdateMonster(501, name: "Märta");
service.DeleteMonster(500);


Logger.ExportLogsToFile();
Error.ReportErrors();