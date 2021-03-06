import 'package:bridge/bridge_client.dart';
import 'package:app/client.dart';

/// This the example boilerplate of a client script file. Inject this
/// script into a template by using the following syntax in a controller.
///
///     return template('templateName').withScript('main');
///
/// A good practice would be to delegate this script into your client
/// application in **lib/client** as neatly as possible.
main() async {
  // Register shared data structures
  registerTransport();

  tether.onConnectionEstablished.listen((_) {
    print('Online mode!');
  });

  tether.onConnectionLost.listen((_) {
    print('Offline mode!');
  });
}
