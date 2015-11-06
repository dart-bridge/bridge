part of main;

class UsersController {
  final Repository<User> users;

  UsersController(Repository<User> this.users);

  Stream<User> index() {
    return users.all();
  }
}
