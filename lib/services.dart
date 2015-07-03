library app_services;
/// This is the main bootstrapper library for the Bridge app.
/// It's where the necessary Bridge components are imported
/// alongside the application implementations
/// of Bridge specific constructs.

/// Application entry
import 'app.dart';
import 'api/api.dart';

/// Core library
import 'package:bridge/core.dart';

/// Components
///
/// Exported libraries can be accessed for service providers
/// but not used locally. Importing allows for both.
export 'package:bridge/http.dart';
export 'package:bridge/database.dart';
export 'package:bridge/view.dart';
import 'package:bridge/tether.dart';

/// Custom Service Providers
///
/// Remember that the service providers are explicitly registered
/// in **config/app.yaml**
part 'service_providers/api_service_provider.dart';
