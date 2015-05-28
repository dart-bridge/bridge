library framework;

import 'package:bridge/core.dart';
import 'package:bridge/http.dart';
import 'package:bridge/tether.dart';
import 'http/controllers.dart';

part 'http/routes.dart';
part 'http/tether_handler.dart';

class HttpServiceProvider implements ServiceProvider {

  load(Routes routes,
       Application app,
       TetherManager manager,
       TetherHandler handler) {
    app.resolve(routes.register);
    manager.registerHandler(handler.register);
  }
}