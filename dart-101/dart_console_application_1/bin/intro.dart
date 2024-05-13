void introControlFlowStatements()
{
	//--using basic variables
	// var name = "Voyager I";
	var year = 1977;
	// var antennaDiameter = 3.7;
	var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
	// var image = {
	// 	'tags': ['saturn'],
	// 	'url': '//path/to/saturn.jpg'
	// };

	//--using control flow statements
	if (year >= 2001)
	{
		print('21st century');
	} 
	else if (year >= 1901) 
	{
		print('20th century');
	}

	//similar to foreach in C#
	for (final object in flybyObjects) 
	{
		print(object);
	}

	for (int val = 1; val <= 4; val++) 
	{
		print(val);
	}

	while (year < 2016) {
		year += 1;
	}
	print('year $year');
}

void introFunctions()
{
	int fibonacci(int n) 
	{
		if (n == 0 || n == 1) return n;
		return fibonacci(n - 1) + fibonacci(n - 2);
	}

	print(fibonacci(7));
}

void introShortHand()
{
	var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
	flybyObjects.where((name) => name.contains('tu')).forEach(print);
}