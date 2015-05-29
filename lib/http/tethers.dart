part of framework;

class TetherRegistration {
  register(Tether tether) {

    // Listen to the client
    tether.listen('inBusiness', (_) {
      // Roger that!
      return true;
    });
  }
}
