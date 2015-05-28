part of controllers;

class ExampleController {
  greet(Greeter greeter, {String name}) {
    return greeter.greet(name);
  }

  index() {

    return view('index', withScript: 'main');
  }
}
