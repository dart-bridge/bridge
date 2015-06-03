import 'package:testcase/testcase.dart';
export 'package:testcase/init.dart';
import 'package:app/app.dart';

class GreeterTest implements TestCase {
  Greeter greeter;

  setUp() {
    greeter = new Greeter();
  }

  tearDown() {}

  @test
  it_greets_a_person() {
    expect(greeter.greet('Friend'), equals('Hello, Friend!'));
  }
}
