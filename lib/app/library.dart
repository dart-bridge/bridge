/// This is the main application library.
library app;

// The shared application library
import '../app_shared/library.dart';
export '../app_shared/library.dart';

import 'package:bridge/bridge.dart';

/// This library contains the server side classes that your application will
/// use. Given the imports above, you have access to the shared objects, like
/// the [User] class, as well as Bridge's entire library of classes, like
/// [Validator] utilities or [Events].
class SkyIsTheLimit {}
