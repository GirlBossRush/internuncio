###
General purpose logger.
* Adds timestamps.
* Retains line numbers.
Caveats: Browsers that do not support console CSS will output logs incorrectly.

[Namespace] [Date] [Message] arguments*
logger = new Internuncio("AJAX")
logger.info("Fetching data.", 42, {foo: "bar"})
[info] [12:25:458] [AJAX] Fetching data. 42 {foo: "bar"}
###

class Color
  constructor: (val) ->
    color = ->
    color.val = val
    color.toString = ->
      "color: #{@val}"

    return color

class Internuncio
  constructor: (namespace) ->
    timestampColor = new Color("#000")
    namespaceColor = new Color("#0000ff")
    # The timestamp must be dynamic, so the console needs to call a function.
    # Functions are implicitly converted to strings when passed to console log methods.
    timestamp = ->
    timestamp.toString = ->
      datetime = new Date()

      datetime.getHours() + ":" + datetime.getMinutes() + ":" + datetime.getMilliseconds()

    for level, levelColor of @levels
      @[level] = console[level].bind console,
        "%c[%s] %c[%s] %c[%s]"
        levelColor
        level
        timestampColor
        timestamp
        namespaceColor
        namespace

Internuncio.prototype.levels =
  debug: new Color("#ff1493")
  error: new Color("#ff0000")
  info:  new Color("#00008b")
  log:   new Color("#006400")
  warn:  new Color("#ff8c00")

if module?.exports?
  module.exports = Internuncio
else
  window.Internuncio = Internuncio
