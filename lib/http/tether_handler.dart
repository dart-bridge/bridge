part of framework;

class TetherHandler {
  register(Tether tether) {

    // Listen to the client
    tether.listen('inBusiness', (_) {
      // Roger that!
      return true;
    });
  }
}
