import 'package:test/test.dart';
import 'package:app/services.dart';
import 'package:bridge/bridge.dart';
import 'package:bridge/test.dart';
export '../storage/.templates.dart';

main() {
  TestApplication app;

  setUp(() async {
    app = await TestApplication.start([
      HttpServiceProvider,
      TetherServiceProvider,
      ViewServiceProvider,
      MainServiceProvider,
    ]);
  });

  test('home page', () async {
    expect(await app.server.get('/').body, contains('<html'));
  });
}
