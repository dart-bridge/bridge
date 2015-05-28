part of framework;

class TetherHandler {
  register(Tether tether) {
    tether.listen('greeting', (String name) {
      return 'Hello, $name';
    });
  }
}
