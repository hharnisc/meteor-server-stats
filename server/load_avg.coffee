os = Npm.require 'os'

class LoadAvg
    load: (callback) ->
        callback = (->) unless typeof callback is 'function'
        loadArray = os.loadavg()
        loadAvgData = 
            "1m": loadArray[0]
            "5m": loadArray[1]
            "15m": loadArray[2]
        callback undefined, loadAvgData
        loadAvgData

