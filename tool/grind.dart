import 'package:grinder/grinder.dart';
import 'package:bridge/grinder.dart';
export '../bridge';

main(args) => grind(args);

@Task()
test() => new TestRunner().testAsync();

@Task()
build() => bridgeCommand(['build']);

@Task()
migrate() => bridgeCommand(['db_migrate']);

@DefaultTask()
@Depends(test)
init() => bridgeCommand(['build', 'db_migrate']);


