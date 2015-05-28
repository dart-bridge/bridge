part of framework;

class Routes {
  register(
      // Controllers --
      InBusinessController controller,
      // --
      Router router) => router
  // Routes
    ..get('/', controller.index)
    ..get('greet/:name', controller.greet);
}
