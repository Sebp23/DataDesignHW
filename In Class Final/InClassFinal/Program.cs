using InClassFinal;

Engine engine = new Engine();

engine.InsertIntoSubscribers();
engine.InsertIntoDependants();


Error.ReportErrors();