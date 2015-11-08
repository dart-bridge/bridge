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

  Future<shelf.Response> globalHandler(
      Object exception,
      StackTrace stack) {
    return errorTemplate(500, exception, stack);
  }

  Future<shelf.Response> notFoundHandler(
      HttpNotFoundException exception,
      StackTrace stack) {
    return errorTemplate(404, exception, stack, {
      'message': "Oops! That page wasn't found!"
    });
  }

  Future<shelf.Response> errorTemplate(
      int code,
      Object exception,
      StackTrace stack,
      [Map<String, dynamic> variables = const {}]) async {

    // Create a template with the specified parameters
    final errorTemplate = await (template('error', withData: variables)
      ..exception = exception
      ..stackTrace = stack
      ..code = code ?? 500);

    // Return a shelf Response from the template and the params
    return new shelf.Response(
        code ?? 500,
        body: errorTemplate.encoded,
        headers: {
          'Content-Type': ContentType.HTML.toString()
        });
  }
}
