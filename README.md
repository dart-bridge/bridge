# A [Bridge](//github.com/emilniklas/dart-bridge) app

## Installation
1. Clone this repository, naming your project folder:
  * `git clone git:github.com/emilniklas/bridge-app my-blog`
2. Enter your new project:
  * `cd my-blog`
3. Remove the Git repo inside:
  * `rm -rf .git`
4. Edit **.gitignore** to not exclude **pubspec.yaml**.
5. Open the project up in your favourite editor.

### What's inside?
You don't have to care about all the files included in this repo.
A couple only sets your environment up. Here are the files and folders that matter:

* __bridge__ – This file is the entry to the __Bridge Shell__. Start the application
by running `dart bridge start`.
* __pubspec.yaml__ – Use it as you normally would, except be wary that changing
the `name` value requires changing some other files in your project.
* __web/__ – Use it as you normally would, except if you use `bridge.view` 
(pre-installed) you don't want to put HTML files here. Look at _templates_ below.
* __config/__ – Contains a tree of YAML files, accessible via the `bridge.core.Config`
component as dot-separated path starting from the config root.
* __config/app.yaml__ – Pay attention to the `service_providers` list. You may not
need to modify it, though.
* __lib/__ – Your entire application lives here. However, you may not have to care
about the _files_ directly inside this folder, only the _folders_.
    * __app/__ – This is the root directory of your application's domain. 
        * __lib.dart__ – Your main library for your application. A good practice is to
        be wary of the boundary between this library and the framework specific classes.
    * __http/__ – This is where your framework specific transport-layer is located.
        * __controllers/__ – Where your controllers can live.
        * __controllers.dart__ – A bootstrapper library for your controllers.
        * __routes.dart__ – Where you register your routes. Inject controllers and
        reference their methods or create closures.
        * __tether_handler.dart__ – Listen for, and send messages to, the client here.
    * __templates__ – The root for your template files.
    
## Getting started
Ensure that the application is working by running `dart bridge`. Once inside the shell
run the `start` command:
```
= start
```
This will start the server and start listening on [localhost:1337](//localhost:1337) as
a default.

Verify that it works.

Start by modifying files within __lib/http/__. 