import 'package:bridge/http.dart';
import 'package:bridge/tether.dart';
import 'controllers/pages_controller.dart';

class Api {
  PagesController controller;

  Api(PagesController this.controller);

  routes(Router router) {
    router.get('/', controller.index);
    router.get('data', controller.apiEndpoint);
  }

  tether(Tether tether) {
    tether.listen('data', (_) => controller.apiEndpoint());
  }
}