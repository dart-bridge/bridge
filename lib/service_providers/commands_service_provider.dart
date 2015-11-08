part of services;

/// This service provider adds you custom commands to the CLI. If this
/// gets too crowded, consider breaking it up into multiple service providers.
/// Just remember to add each provider to [config:app.service_providers]
@DependsOn(DatabaseServiceProvider)
class CommandsServiceProvider extends ServiceProvider {
  Program cli;
  Repository<User> users;

  Future load(Program cli, Repository<User> users) async {
    this.cli = cli;
    this.users = users;

    cli.addCommand(new_user);
  }

  @Command('Register a new user')
  new_user() async {
    // Get a first name
    final firstName = await cli.ask(const Question('First name', type: String));

    // Get a last name
    final lastName = null; //await cli.ask(const Question('Last name', type: String));

    // Get an email address
    final email = await cli.ask(const Question('Email address', type: String,
        match: r'[\w.-]+@[\w.-]+\.[a-z]+',
        message: 'That\'s not a valid email address!'));

    // Create user object
    final user = new User()
      ..firstName = firstName
      ..lastName = lastName
      ..email = email;

    // Save user to database
    await users.save(user);

    // Print some feedback
    cli.printAccomplishment('$firstName $lastName successfully registered!');
  }
}
