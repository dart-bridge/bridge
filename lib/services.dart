library services;
/// This is the main bootstrapper library for the Bridge app.
/// It's where the necessary Bridge components are imported
/// alongside the application implementations
/// of Bridge specific constructs.

/// Application entry
import 'app.dart';
import 'main/main.dart';

/// Core libraries
import 'dart:async';
import 'dart:io';
import 'package:bridge/bridge.dart';

/// External libraries
import 'package:shelf/shelf.dart' as shelf;

/// Custom Service Providers
///
/// Remember that the service providers are explicitly registered
/// in **config/app.yaml**
part 'service_providers/main_service_provider.dart';
part 'service_providers/http_exceptions_service_provider.dart';
part 'service_providers/commands_service_provider.dart';
part 'service_providers/welcome_service_provider.dart';
