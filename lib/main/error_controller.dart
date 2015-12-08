part of main;

/// This controller is completely arbitrary. You can choose to set up
/// your environment however you like!
class ErrorController {
  // lib/templates/error.chalk.html
  static const errorTemplate = 'error';

  general(Object exception, StackTrace stack) {
    print('<red>Uncaught error!\n$exception</red>');

    return template(errorTemplate)
      ..exception = exception
      ..stackTrace = stack
      ..code = 500;
  }

  notFound(HttpNotFoundException exception, StackTrace stack) {
    return template(errorTemplate)
      ..message = "Oops! That page wasn't found!"
      ..exception = exception
      ..stackTrace = stack
      ..code = 404;
  }
}
