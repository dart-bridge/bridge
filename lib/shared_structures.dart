import 'package:bridge/src/tether/library_shared.dart';
import 'package:bridge/src/view/shared/library.dart';

registerSharedStructures(Tether tether) {
  tether.registerStructure('Template', Template, (s) => new Template.deserialize(s));
}