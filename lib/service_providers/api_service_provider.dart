part of app_services;

class ApiServiceProvider implements ServiceProvider {
  load(Container container, Api api, TetherManager tethers) async {

    // Register routes
    await container.resolve(api.routes);

    // Register tether handler
    tethers.registerHandler((Tether tether) {
      container.resolve(api.tether, injecting: {Tether: tether});
    });
  }
}
