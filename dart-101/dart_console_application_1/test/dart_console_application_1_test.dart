import 'package:dart_console_application_1/calculations.dart';
import 'package:test/test.dart';

void main() 
{
	test('calculate', () 
	{
		expect(calculate(), 42);
	});

	test('calculate 2', ()
	{
		expect(calculate(), 43);
	});
}
