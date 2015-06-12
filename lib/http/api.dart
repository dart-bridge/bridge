import 'package:bridge/http.dart';
import 'package:bridge/tether.dart';
import 'controllers/pages_controller.dart';
import 'package:bridge/core.dart';

class Api {
  PagesController controller;

  Api(PagesController this.controller);

  routes(Router router) {
    router.get('/', controller.index);
    router.get('greet/:name', controller.greet);
    router.get('resource', controller.resource);
  }

  tether(Tether tether, Container c) {
    tether.listen('greet', (name) => c.resolve(controller.greet, namedParameters: {'name': name}));
    tether.listen('resource', c.presolve(controller.resource));
  }
}
