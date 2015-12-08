library main;

import 'dart:async';
import 'dart:io';

import 'package:bridge/bridge.dart';

import '../app.dart';

/// Controllers
part 'pages_controller.dart';
part 'error_controller.dart';

/// This is the entry point to the transport layer of the application.
/// It's where tether calls and HTTP routes are delegated to controllers.
///
/// Note that the same controller instance will be used for all requests.
class Main extends Pipeline {
  /// You can use dependency injection to inject whatever you want, including
  /// your own classes from the [app] library.
  SkyIsTheLimit skyIsTheLimit;

  PagesController controller;
  ErrorController errorController;

  Main(this.controller, this.errorController, this.skyIsTheLimit);

  /// This is the list of global Middleware to be used on all routes.
  /// It can contain nested lists of Types, objects and functions
  /// that conform to the Shelf Middleware type alias.
  @override get middleware => [
    defaultMiddleware,
    TetherMiddleware,
    TemplatesMiddleware,
  ];

  /// This is where your pipeline registers its error handlers. The
  /// handler specified works just like a route handler, and will be
  /// used when a route handler or middleware throws an error or exception
  /// of a specific type.
  @override get errorHandlers => {
    HttpNotFoundException: errorController.notFound,

    // This entry catches all errors since everything is a subtype of
    // Object. This must come last in the Map, because it will override
    // all that comes after it.
    Object: errorController.general,
  };

  routes(Router router) {
    router.get('/', controller.index).named('index');
  }

  tether(Tether tether) {
  }
}
