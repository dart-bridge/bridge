import 'package:bridge/tether_client.dart';

main() async {
  await globalTether();

  String greeting = await tether.send('greeting', 'Emil');

  print(greeting);
}