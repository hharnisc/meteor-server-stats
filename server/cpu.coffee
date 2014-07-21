os = Npm.require 'os'

class CPU
    @_maxInterval: 61
    constructor: ->
        @_intervals = 
            [
                {
                    label: "1s" 
                    interval: 1
                }
                {
                    label: "5s" 
                    interval: 5,    
                }
                {
                    label: "15s" 
                    interval: 15,    
                }
                {
                    label: "1m" 
                    interval: 60,    
                }
            ]

        @_samples = []
        # store one minute worth of cpu
        # samples every second
        @_intervalId = Meteor.setInterval =>
            @_samples.unshift() if @_samples.length >= @_maxInterval
            @_samples.push os.cpus()
        , 1000

    utilization: (callback) ->
        callback = (->) unless typeof callback is 'function'
        utilizationData = {}
        utilizationData[interval.label] = @_intervalUtilization interval.interval for interval in @_intervals
        callback undefined, utilizationData
        utilizationData

    _intervalUtilization: (interval) ->
        if @_samples.length <= interval
            return undefined

        startVal = @_samples[-1-interval..][0]
        endVal = @_samples[-1..][0]

        diffs = [0...startVal.length].map (i) =>
            @_calcIntervalUtilization startVal[i], endVal[i]
        diffs

    _calcIntervalUtilization: (startVal, endVal) ->
        t0 = startVal.times
        t1 = endVal.times
        
        busy = @_sumBusy(t1) - @_sumBusy(t0)
        idle = @_sumIdle(t1) - @_sumIdle(t0)
        busy / (idle + busy)

    _sumBusy: (times) ->
        (time for name, time of times when name isnt 'idle')
            .reduce (a, b) -> a + b

    _sumIdle: (times) ->
        times.idle

    destroy: ->
        Meteor.clearInterval @_intervalId