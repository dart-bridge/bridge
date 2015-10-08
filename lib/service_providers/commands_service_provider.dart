part of services;

/// This service provider adds you custom commands to the CLI. If this
/// gets too crowded, consider breaking it up into multiple service providers.
/// Just remember to add each provider to [config:app.service_providers]
class CommandsServiceProvider extends ServiceProvider {
  Program cli;
  Repository<User> users;

  Future load(Program cli, Repository<User> users) async {
    this.cli = cli;
    this.users = users;

    cli.addCommand(new_user);
  }

  @Command('Register a new user')
  new_user({String first_name, String last_name, String email}) async {
    // Ensure we have a first_name
    if (first_name == null)
      first_name = await cli.ask(const Question('First name', type: String));

    // Ensure we have a last_name
    if (last_name == null)
      last_name = await cli.ask(const Question('Last name', type: String));

    // Ensure we have an email address
    if (email == null)
      email = await cli.ask(const Question('Email address', type: String,
          match: r'[\w.-]+@[\w.-]+\.[a-z]+',
          message: 'That\'s not a valid email address!'));

    final user = new User()
      ..firstName = first_name
      ..lastName = last_name
      ..email = email;

    await users.add(user);

    cli.printAccomplishment('$first_name $last_name successfully registered!');
  }
}
