part of main;

class UsersController {
  final Repository<User> users;

  UsersController(Repository<User> this.users);

  Future<List<User>> index() {
    return users.all().toList();
  }
}
