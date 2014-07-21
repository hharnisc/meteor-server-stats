# Meteor Server Stats

A meteor package to grab system stats (cpu, memory, load, versions, hostname) from the server.

**Table Of Contents**

- [History](#history)
- [Quickstart](#quickstart)
- [Usage](#usage)

## History

**Latest Version:** 0.1.0

- Initial implementation, gives you basic system load information

## Quickstart

```sh
$ mrt create app
$ cd app
$ rm app.html
$ rm app.css
$ mrt add server-stats
```

**app.js**

```javascript
if (Meteor.isServer) {
    Meteor.startup(function () {
        var stats = new ServerStats();

        Meteor.setInterval(function() {
            console.log(stats.stats());
        }, 1000);
    });
}
```

Now you should see server stats on the console updated every second.

** Output **

```json
{ 
    loadAvg: { 
        '1m': 1.3720703125,
        '5m': 1.572265625,
        '15m': 1.62158203125 
    },
    cpu: { 
        '1s': [ 
            0.08,
            0.02,
            0.030303030303030304,
            0.01
        ],
        '5s': [
            0.096,
            0.011976047904191617,
            0.042,
            0.008
        ],
        '15s': [ 
            0.09320905459387484,
            0.009986684420772303,
            0.039280958721704395,
            0.007323568575233023
        ],
        '1m': [
            0.09883527454242928,
            0.013646197370610751,
            0.05125644866034282,
            0.012314861041770677 
        ]
    },
    memory: {
        system: 0.5226848125457764,
        process: 0.0031485557556152344,
        heap: 0.47618774928774926
    },
    uptime: {
        system: 389643,
        process: 81
    },
    versions: {
        http_parser: '1.0',
        node: '0.10.28',
        v8: '3.14.5.9',
        ares: '1.9.0-DEV',
        uv: '0.10.27',
        zlib: '1.2.3',
        modules: '11',
        openssl: '1.0.1g'
    },
    host: 'http://localhost:3000/'
}

```

##Usage

All of the functions return the value directly and can be given an optional callback which returns the standard (error, result).

**All stats**

```javascript
var stats = new ServerStats();
stats.stats();
```

**CPU**

```javascript
var cpu = new CPU();
cpu.utilization();
```

**Memory**

```javascript
var memory = new Memory();
memory.system();
memory.process();
memory.heap();
```

**Versions**

```javascript
var versions = new Versions();
versions.versions();
```

**Uptime**

```javascript
var uptime = new Uptime();
uptime.system();
uptime.process();
```

**LoadAvg**

```javascript
var loadavg = new LoadAvg();
loadavg.load();
```
