library main;

import 'dart:async';

import 'package:bridge/bridge.dart';
import '../app.dart';

/// Controllers
part 'pages_controller.dart';
part 'users_controller.dart';

/// This is the entry point to the transport layer of the application.
/// It's where tether calls and HTTP routes are delegated to controllers.
///
/// Note that the same controller instance will be used for all requests.
class Main {
  PagesController controller;
  UsersController usersController;

  Main(PagesController this.controller,
      UsersController this.usersController);

  routes(Router router) {
    router.get('/', controller.index).named('index');
    router.get('users', usersController.index).named('users');
  }

  tether(Tether tether) {
    tether.listen('users', usersController.index);
  }
}
