/// This is the main client side application library.
library app;

// The shared application library
import '../app_shared/library.dart';
export '../app_shared/library.dart';

import 'package:bridge/bridge_client.dart';

/// This library contains all your client side logic. It can import [dart:html].
/// Given the imports above, we have access to both the shared classes, like
/// [User], and Bridge's client specific utilities, like [Validator].
class WebAppsRule {}