os = Npm.require 'os'

class Memory
    system: (callback) ->
        callback = (->) unless typeof callback is 'function'
        total = os.totalmem()
        free = os.freemem()
        callback undefined, sysmem = (total - free) / total
        sysmem

    process: (callback) ->
        callback = (->) unless typeof callback is 'function'
        total = os.totalmem()
        used = process.memoryUsage().rss

        callback undefined, processmem = used / total
        processmem

    heap: (callback) ->
        callback = (->) unless typeof callback is 'function'

        mem = process.memoryUsage()
        callback undefined, heapmem = mem.heapUsed / mem.heapTotal
        heapmem