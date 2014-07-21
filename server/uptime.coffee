os = Npm.require 'os'

class Uptime
    system: (callback) ->
        callback = (->) unless typeof callback is 'function'
        callback undefined, uptime = os.uptime()
        uptime

    process: (callback) ->
        callback = (->) unless typeof callback is 'function'
        callback undefined, uptime = process.uptime()
        uptime