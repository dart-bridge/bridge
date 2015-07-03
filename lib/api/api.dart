import 'package:bridge/http.dart';
import 'package:bridge/tether.dart';

/// Controllers
import 'pages_controller.dart';

/// This is the entry point for the client side application.
/// It's where tether calls and HTTP routes are delegated to controllers.
///
/// Note that the same controller instance will be used for all requests.
class Api {
  PagesController controller;

  Api(PagesController this.controller);

  routes(Router router) {
    router.get('/', controller.index, name: 'index');
  }

  tether(Tether tether) {
    resolveTetherListener(tether, 'index', controller.index);
  }
}
