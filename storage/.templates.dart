import 'package:bridge/view.dart';
class Templates extends TemplateCache {
Templates(Map<Symbol, dynamic> variables) : super(variables);
Map<String, TemplateGenerator> get collection => {
'app': () async* {
yield '''<!DOCTYPE html>''';
yield '''<html lang="en">''';
yield '''<head>''';
yield '''  <title>Bridge</title>''';
yield '''  <script src="//use.typekit.net/dcz8uda.js"></script>''';
yield '''  <script>try {Typekit.load();} catch (e) {}</script>''';
yield '''  <style>''';yield* $generate('example-styles');yield '''</style>''';
yield '''</head>''';
yield '''<body>''';
yield '''  <div class="wrap-all">''';
yield '''    <div class="wrap-row">''';
yield '''      <div class="wrap-cell">''';
yield* $block('content');
yield '''      </div>''';
yield '''    </div>''';
yield '''  </div>''';
yield '''</body>''';
yield '''</html>''';

},
'error': () async* {
yield* $extends('app', {

'content': () async* {
yield '''  <h3>''';
yield '''    ${$esc(message == null ? 'Oops! Something went wrong!' : message)}''';
yield* $if([[code != 200 && code != null, () async* {
yield '''      <small>(${$esc(code)})</small>''';
}]]);
yield '''  </h3>''';


yield* $if([[Environment.isDevelopment && stackTrace != null, () async* {
yield '''    <h6>${$esc(exception)}</h6>''';
yield '''    <pre class='stack-trace'>${$esc($new(#Chain.forTrace)(stackTrace).terse)}</pre>''';
}]]);
},

});

},
'example-styles': () async* {
for (final line in r'''
body, html, .wrap-all {
    height:100%;
    width:100%;
    margin:0;
    padding:0;
    background-color: #f4f4f4;
    font-family: 'aktiv-grotesk-std', Helvetica, sans-serif;
    font-size: 1.2em;
}
img {
    max-width: 10em;
    box-sizing: border-box;
    padding:0 1em;
    width:100%;
}
.wrap-all {
    display: table;
}
.wrap-row {
    display: table-row;
}
.wrap-cell {
    display: table-cell;
    vertical-align: middle;
    text-align: center;
}
iframe {
    display: inline-block;
    margin: auto;
    width: 3.25em;
    padding-top: 0.2em;
    vertical-align: bottom;
}
.stack-trace {
    font-size: 0.5em;
    white-space: pre-wrap;
    text-align: left;
    max-width: 70em;
    margin: auto;
    background: #fbfbfb;
    padding:1em;
}
'''.split('\n')) yield line;

},
'index': () async* {
yield* $extends('app', {

'content': () async* {
yield '''  <div>''';
yield '''    <img src="http://dart-bridge.github.io/images/logo-blue.svg" alt="Bridge">''';
yield '''  </div>''';
yield '''  <iframe src="https://ghbtns.com/github-btn.html?user=dart-bridge&repo=framework&type=star&count=true"''';
yield '''          frameborder="0" scrolling="0" height="20px"></iframe>''';
yield '''  <iframe src="https://ghbtns.com/github-btn.html?user=dart-bridge&repo=framework&type=watch&count=true&v=2"''';
yield '''          frameborder="0" scrolling="0" width="170px" height="20px"></iframe>''';
},
});

},
};
}
