library framework;

import 'package:bridge/core.dart';
import 'package:bridge/http.dart';
import 'package:bridge/tether.dart';
import 'http/controllers.dart';

part 'http/routes.dart';
part 'http/tethers.dart';

class BridgeApplicationServiceProvider implements ServiceProvider {

  load(Routes routes,
       Application app,
       TetherManager manager,
       TetherRegistration registration) {
    app.resolve(routes.register);
    manager.registerHandler(registration.register);
  }
}