library main;

import 'dart:async';
import 'dart:io';

import 'package:bridge/bridge.dart';

import '../app.dart';

/// Controllers
part 'pages_controller.dart';

/// This is the entry point to the transport layer of the application.
/// It's where tether calls and HTTP routes are delegated to controllers.
///
/// Note that the same controller instance will be used for all requests.
class Main extends Pipeline {
  /// You can use dependency injection to inject whatever you want, including
  /// your own classes from the [app] library.
  SkyIsTheLimit skyIsTheLimit;
  PagesController controller;

  Main(this.controller, this.skyIsTheLimit);

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
    HttpNotFoundException: _catch404,

    // This entry catches all errors since everything is a subtype of
    // Object. This must come last in the Map, because it will override
    // all that comes after it.
    Object: _catchAll,
  };

  routes(Router router) {
    router.get('/', controller.index).named('index');
  }

  tether(Tether tether) {
  }

  Future<Response> _catchAll(
      Object exception,
      StackTrace stack) {
    print('<red>Uncaught error!\n$exception</red>');
    return _errorTemplate(exception, stack);
  }

  Future<Response> _catch404(
      HttpNotFoundException exception,
      StackTrace stack) {
    return _errorTemplate(exception, stack, 404, {
      'message': "Oops! That page wasn't found!"
    });
  }

  Future<Response> _errorTemplate(
      Object exception,
      StackTrace stack,
      [int code = 500,
      Map<String, dynamic> variables = const {}]) async {

    // Create a template with the specified parameters
    final errorTemplate = await (template('error', withData: variables)
      ..exception = exception
      ..stackTrace = stack
      ..code = code);

    // Return a shelf Response from the template and the params
    return new Response(
        code,
        body: errorTemplate.encoded,
        headers: {
          'Content-Type': ContentType.HTML.toString()
        });
  }
}
