library main;

import 'package:bridge/bridge.dart';

/// Controllers
part 'pages_controller.dart';

/// This is the entry point to the transport layer of the application.
/// It's where tether calls and HTTP routes are delegated to controllers.
///
/// Note that the same controller instance will be used for all requests.
class Main {
  PagesController controller;

  Main(PagesController this.controller);

  routes(Router router) {
    router.get('/', controller.index).named('index');
  }

  tether(Tether tether) {
    resolveTetherListener(tether, 'index', controller.index);
  }
}
