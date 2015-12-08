part of main;

/// This controller is completely arbitrary. You can choose to set up
/// your environment however you like!
class ErrorController {
  // lib/templates/error.chalk.html
  static const errorTemplate = 'error';

  Future<Response> general(
      Object exception,
      StackTrace stack) {
    print('<red>Uncaught error!\n$exception</red>');
    return _errorTemplate(exception, stack);
  }

  Future<Response> notFound(
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
    final errorTemplate = await (template(errorTemplate, withData: variables)
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
