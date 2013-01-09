# Hubot Blitz Script

Expose Blitz.io load testing via hubot.


## Installation

I've tweaked Hubot to load scripts from node modules.  If you're using [my fork](https://github.com/MarkBorcherding/hubot/tree/load-hubot-scripts-from-npm) then
all you need to do is add `hubot-script-blitz` to the `packages.json` (once it gets added
to the NPM registry) and then again to the `hubot-scripts.json`.

You will need to configure two environment variables:

* `HUBOT_BLITZ_EMAIL` - The email address of your account.
* `HUBOT_BLITZ_API_KEY` - The API Key for your Blitz.io account.

## Usage

The usage right now is very simple:
```
Joe: hubot blitz me http://example.com
Hubot: from: virginia
duration: 0.1183
status: 301
connect: 0.104818
```

More the API will get leveraged and commands will become richer.


