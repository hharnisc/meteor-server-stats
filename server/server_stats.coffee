class ServerStats
    constructor: ->
        @_cpu = new CPU()
        @_memory = new Memory()
        @_versions = new Versions()
        @_uptime = new Uptime()
        @_loadAvg = new LoadAvg()

    stats: (callback) ->
        stats = 
            loadAvg: @_loadAvg.load()
            cpu:
                @_cpu.utilization()
            memory:
                system: @_memory.system()
                process: @_memory.process()
                heap: @_memory.heap()
            uptime:
                system: @_uptime.system()
                process: @_uptime.process()
            versions: @_versions.versions()
            host: Meteor.absoluteUrl()

    destroy: ->
        @_cpu.destroy()