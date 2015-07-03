import 'package:bridge/view.dart';
//import 'package:app/app.dart';

/// This is a controller. You can inject classes just by declaring the
/// type of an argument. You can do this both in the constructor and
/// in the methods.
///
/// You'll probably want to import your main application above
/// (uncomment the second line).
class PagesController {
  index() {
    return template('index');
  }
}
