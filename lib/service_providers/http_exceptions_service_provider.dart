part of services;

/// This service provider is dedicated to creating pretty feedback to the client
/// when exceptions are thrown in the HTTP layer.
///
/// If this is not using the template function to return templates from
/// [bridge.view], the [DependsOn] annotation can be removed.
@DependsOn(ViewServiceProvider)
class HttpExceptionsServiceProvider extends ServiceProvider {
  load(Server server) async {
    // This is the global exception handler. It must be registered first.
    server.handleException(Object, globalHandler);

    // Subsequent handlers should go from unspecific to specific exceptions.
    // In other words: base classes first, sub classes last.
    server.handleException(HttpNotFoundException, notFoundHandler);
  }

  Future<shelf.Response> notFoundHandler(Exception exception, StackTrace stack) async {
    return errorTemplate(await template('error', withData: {
      'exception': exception,
      'stackTrace': stack,
      'message': 'Oops! That page wasn\'t found!',
      'code': 404,
    }));
  }

  Future<shelf.Response> globalHandler(Object exception, StackTrace stack) async {
    return errorTemplate(await template('error', withData: {
      'exception': exception,
      'stackTrace': stack,
      'code': 500,
    }));
  }

  /// Turns a [Template] containing a 'code' integer field in the
  /// data map, into a [shelf.Response]
  shelf.Response errorTemplate(Template template) {
    return new shelf.Response(
        template.data.containsKey('code') ? template.data['code'] : 500,
        body: template.encoded,
        headers: {
          'Content-Type': ContentType.HTML.toString()
        });
  }
}
