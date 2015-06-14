import 'package:bridge/http.dart';
import 'package:bridge/tether.dart';
import 'controllers/pages_controller.dart';
import 'package:bridge/core.dart';

class Api {
  PagesController controller;

  Api(PagesController this.controller);

  routes(Router router) {
    router.get('/', controller.index);
  }

  tether(Tether tether, Container c) {
  }
}
