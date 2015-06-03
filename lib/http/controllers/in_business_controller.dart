part of controllers;

class InBusinessController {
  greet(Greeter greeter, {String name}) {
    return greeter.greet(name);
  }

  index(Greeter greeter) {
    return template(
        // Refers to [lib/templates/index.btl]
        'index',

        // Will inject [web/main.dart]
        withScript: 'main',

        // Send data to the template
        withData: {
          'greeting': greeter.greet('World')
        }
    );
  }
}
