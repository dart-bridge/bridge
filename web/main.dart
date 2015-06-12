import 'package:bridge/tether_client.dart';

main() async {
  // Connect the tether
  await globalTether();

  print(await tether.send('greet', 'Server'));
}