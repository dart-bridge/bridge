part of framework;

class Routes {
  register(
      // Controllers
      InBusinessController controller,
      // -----------
      Router router) {
    (router
      ..get('/', controller.index)
      ..get('greet/:name', controller.greet)
    );
  }
}
