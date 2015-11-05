part of services;

class WelcomeServiceProvider extends ServiceProvider {
  setUp(Program cli) {
    cli.print('''

    <green><underline>Hello, and welcome to the Bridge Framework!</underline></green>

    Type <yellow>help</yellow> and press enter to see
    the different commands that you can use!
''');
  }
}