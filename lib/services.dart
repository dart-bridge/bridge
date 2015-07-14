library app_services;
/// This is the main bootstrapper library for the Bridge app.
/// It's where the necessary Bridge components are imported
/// alongside the application implementations
/// of Bridge specific constructs.

/// Application entry
import 'package:app/app.dart';
import 'api/api.dart';

/// Core libraries
import 'dart:async';
import 'dart:io';
import 'package:bridge/core.dart';

/// Components
///
/// Exported libraries can be accessed for service providers
/// but not used locally. Importing allows for both.
import 'package:bridge/http.dart';
export 'package:bridge/database.dart';
import 'package:bridge/view.dart';
import 'package:bridge/tether.dart';

/// External libraries
import 'package:shelf/shelf.dart' as shelf;

/// Custom Service Providers
///
/// Remember that the service providers are explicitly registered
/// in **config/app.yaml**
part 'service_providers/api_service_provider.dart';
part 'service_providers/http_exceptions_service_provider.dart';
