import 'package:bridge/tether_client.dart';
import 'dart:html';
import 'dart:async';

main() async {
  // Connect the tether
  await globalTether();

  // Check that the server responds
  await tether.send('inBusiness');

  // Wait a moment (since we're so freaking fast!)
  await new Future.delayed(const Duration(seconds: 2));

  // Mix it up!
  document.querySelector('.wrap-all').style.backgroundColor = '#ff0050';
  document.querySelector('h1').text = 'We\'re in business!';
}