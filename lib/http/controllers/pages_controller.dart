import 'package:bridge/view.dart';
import 'package:app/app.dart';

class PagesController {
  index(Greeter greeter) {
    return template(
        'index',
        withScript: 'main',
        withData: {
          'greeting': greeter.greet('Bridge')
        });
  }

  greet(Greeter greeter, {String name}) {
    return {
      'response': greeter.greet(name)
    };
  }

  resource() {
    return [
      'some',
      'resource'
    ];
  }
}
