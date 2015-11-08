library main;

import 'package:bridge/bridge.dart';
import '../app.dart';

/// Controllers
part 'pages_controller.dart';

/// This is the entry point to the transport layer of the application.
/// It's where tether calls and HTTP routes are delegated to controllers.
///
/// Note that the same controller instance will be used for all requests.
class Main {
  /// You can use dependency injection to inject whatever you want, including
  /// your own classes from the [app] library.
  SkyIsTheLimit skyIsTheLimit;
  PagesController controller;

  Main(this.controller, this.skyIsTheLimit);

  routes(Router router) {
    router.get('/', controller.index).named('index');
  }

  tether(Tether tether) {
  }
}
