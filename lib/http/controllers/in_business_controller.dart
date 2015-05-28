part of controllers;

class InBusinessController {
  greet(Greeter greeter, {String name}) {
    return greeter.greet(name);
  }

  index() {
    return template('index', withScript: 'main');
  }
}
