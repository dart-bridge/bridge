part of services;

/// This is a service provider. It will be instantiated when the program is
/// started using `dart bridge`. Read more about the [ServiceProvider]
/// to learn how to implement your own.
class MainServiceProvider extends ServiceProvider {
  load(Container container, Main main, TetherManager tethers) async {
    // Register routes
    await container.resolve(main.routes);

    // Register shared data structures
    registerTransport();

    // Register tether handler
    tethers.registerHandler((Tether tether) {

      // Resolve the tether method on the [Main] class
      container.resolve(main.tether, injecting: {Tether: tether});
    });
  }
}
