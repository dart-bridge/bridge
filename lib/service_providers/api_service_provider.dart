part of app_services;

/// This is a service provider. It will be instantiated when the program is
/// started using `dart bridge`. Read more about the [ServiceProvider]
/// to learn how to implement your own.
class ApiServiceProvider implements ServiceProvider {
  load(Container container, Api api, TetherManager tethers) async {
    // Register routes
    await container.resolve(api.routes);

    // Register tether handler
    tethers.registerHandler((Tether tether) {
      // Register shared data structures
      registerSharedStructures(tether);

      // Resolve the tether method on the [Api] class
      container.resolve(api.tether, injecting: {Tether: tether});
    });
  }
}
