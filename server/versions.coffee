os = Npm.require 'os'

class Versions
    versions: (callback) ->
        callback = (->) unless typeof callback is 'function'
        callback undefined, process.versions
        process.versions
