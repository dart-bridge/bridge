part of framework;

class Routes {
  register(
      // Controllers --
      ExampleController controller,
      // --
      Router router) => router
  // Routes
    ..get('/', controller.index)
    ..get('greet/:name', controller.greet);
}
