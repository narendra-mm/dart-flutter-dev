import 'dart:io';

void testExceptions()
{
	var astronauts = 0;
	if(astronauts == 0)
	{
		throw StateError("No astronauts");
	}
}

Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  	try 
	{
    	for (final object in flybyObjects) 
		{
      		var description = await File('test-only-files/$object.txt').readAsString();
      		print(description);
   	 	}
  	} 
	on IOException catch (e) 
	{
    	print('Could not describe object: $e');
  	} 
	finally 
	{
		print('@finally: end of method');
    	flybyObjects.clear();
	}
}

void testTryCatch()
{
	var flybyObjects = ['Jupiter', 'Saturn','Uranus','Neptune'];
	describeFlybyObjects(flybyObjects);
}