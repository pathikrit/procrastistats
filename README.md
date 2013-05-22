A simple command line tool to download your [Pocket](http://getpocket.com) (formerly Read It Later) data

Initial one time setup:

0. You need [nodejs](http://nodejs.org/), [coffee-script](http://coffeescript.org/#installation) and [curl](http://curl.haxx.se/) on your system
0. Create a [new Pocket app](http://getpocket.com/developer/apps/new)
0. Note down the [CONSUMER_KEY](http://getpocket.com/developer/apps/) of your new app
0. Update the `app.coffee` file by using your `CONSUMER_KEY` on line 1
0. `npm install` to install all dependencies
0. Run app by doing `app.coffee`
0. First time only - it will open a new window in your browser asking you to authenticate the app (tested on OSX)

Subsequently:

0. Simply run app by doing `app.coffee`
0. All your data will be downloaded to `pocket.json` file
