import 'dart:io';

const oneSecond = Duration(seconds: 1);
// ···
Future<void> printWithDelay(String message) async 
{
	await Future.delayed(oneSecond);
	print('$message at ${DateTime.now().toIso8601String()}');
}

//The method above is equivalent to
Future<void> printWithDelay2(String message) 
{
	return Future.delayed(oneSecond).then((_) 
	{
		print('$message at ${DateTime.now().toIso8601String()}');
	});
}

void testAsync()
{
	print('time is ${DateTime.now().toIso8601String()}');
	printWithDelay2('violaa!!!');
}

//next example shows, async and await help make asynchronous code easy to read.
Future<void> createDescriptions(Iterable<String> objects) async 
{
	for (final object in objects) 
	{
		try 
		{
			var file = File('$object.txt');
			if (await file.exists()) 
			{
				var modified = await file.lastModified();
				print('File for $object already exists. It was modified on $modified.');
				continue;
			}
			await file.create();
			await file.writeAsString('Start describing $object in this file.');
		} 
		on IOException catch (e) 
		{
			print('Cannot create description for $object: $e');
		}
	}
}

void testAsyncIO()
{
	Iterable<String> fileNames = ['file1', 'file2', 'file3'];
	createDescriptions(fileNames);
}