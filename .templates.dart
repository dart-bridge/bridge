// THIS FILE WAS GENERATED BY bridge.view AND SHOULD NOT BE MODIFIED

library templates_2015_07_03_10_35_15_872;

import "package:bridge/view.dart";

@proxy
class Templates extends TemplateCollection {
  Map<String, TemplateGenerator> get templates => {
    "example-styles": () async => new Template(parsed: """body, html, .wrap-all {
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
}""", asHandlebars: """body, html, .wrap-all {
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
}""", data: data),
    "index": () async => new Template(parsed: """<!doctype html>
<html lang='en'>
<head>
  <title>Bridge</title>
  <script src="//use.typekit.net/dcz8uda.js"></script>
  <script>try {
    Typekit.load();
  } catch (e) {
  }</script>
  <style>${await $include('example-styles')}</style>
</head>

<body>
  <div class="wrap-all">
    <div class="wrap-row">
      <div class="wrap-cell">
        <div>
          <img src="http://dart-bridge.github.io/images/logo-blue.svg" alt="Bridge">
        </div>
        <iframe src="https://ghbtns.com/github-btn.html?user=dart-bridge&repo=framework&type=star&count=true"
                frameborder="0" scrolling="0" height="20px"></iframe>
        <iframe src="https://ghbtns.com/github-btn.html?user=dart-bridge&repo=framework&type=watch&count=true&v=2"
                frameborder="0" scrolling="0" width="170px" height="20px"></iframe>
      </div>
    </div>
  </div>
</body>
</html>
""", asHandlebars: """<!doctype html>
<html lang='en'>
<head>
  <title>Bridge</title>
  <script src="//use.typekit.net/dcz8uda.js"></script>
  <script>try {
    Typekit.load();
  } catch (e) {
  }</script>
  <style>${(await $include('example-styles')).asHandlebars}</style>
</head>

<body>
  <div class="wrap-all">
    <div class="wrap-row">
      <div class="wrap-cell">
        <div>
          <img src="http://dart-bridge.github.io/images/logo-blue.svg" alt="Bridge">
        </div>
        <iframe src="https://ghbtns.com/github-btn.html?user=dart-bridge&repo=framework&type=star&count=true"
                frameborder="0" scrolling="0" height="20px"></iframe>
        <iframe src="https://ghbtns.com/github-btn.html?user=dart-bridge&repo=framework&type=watch&count=true&v=2"
                frameborder="0" scrolling="0" width="170px" height="20px"></iframe>
      </div>
    </div>
  </div>
</body>
</html>
""", data: data),
  };
}