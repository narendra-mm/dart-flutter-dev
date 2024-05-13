class Spacecraft
{
  	String name;
	DateTime? launchDate;

	// Read-only non-final property
  	int? get launchYear => launchDate?.year;

	// Constructor, with syntactic sugar for assignment to members.
  	Spacecraft(this.name, this.launchDate)
	{
    // Initialization code goes here.
  	}

	// Named constructor that forwards to the default one.
  	Spacecraft.unlaunched(String name) : this(name, null);

	// Method.
	void describe() 
	{
		print('Spacecraft: $name');
		// Type promotion doesn't work on getters.
		var launchDate = this.launchDate;
		if (launchDate != null) 
		{
			int years = DateTime.now().difference(launchDate).inDays ~/ 365;
			print('Launched: $launchYear ($years years ago)');
		} 
		else 
		{
			print('Unlaunched');
		}
	}
}

void testClass()
{
	var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
	voyager.describe();

	var voyager3 = Spacecraft.unlaunched('Voyager III');
	voyager3.describe();
}

class Orbiter extends Spacecraft
{
	double altitude;

	//constructor for inherited class with extra parameters
	Orbiter(super.name, DateTime super.launchDate, this.altitude);

	void describe2()
	{
		super.describe();
		print('flying altitude at $altitude meters');
	}
}

void testInheritance()
{
	var val = Orbiter('Voyager IV', DateTime(2014,4,18), 20000);
	val.describe2();
}

//Mixins are a way of reusing code in multiple class hierarchies. The following is a mixin declaration
mixin Piloted
{
	int astronauts = 1;

	void describeCrew(int crewNo)
	{
		print('Number of astrobauts = $crewNo');
	}
}

class PilotedCraft extends Spacecraft with Piloted
{
	PilotedCraft(super.name, super.launchDate, int crewCount);
	
	void getInfo()
	{
		describe();
		describeCrew(2);
	}
}

void testMixin()
{
	var val = PilotedCraft('Traveller I', DateTime(2023,7,24), 4);
	val.getInfo();
}