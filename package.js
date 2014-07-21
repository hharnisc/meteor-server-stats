Package.describe({
  summary: 'server-stats'
});



Package.on_use(function (api) {
  // api.use('http', ['client', 'server']);
  api.use('coffeescript');

  api.export('ServerStats', 'server');
  api.export('CPU', 'server');
  api.export('Memory', 'server');
  api.export('Uptime', 'server');
  api.export('Versions', 'server');
  api.export('LoadAvg', 'server');

  // Generated with: github.com/philcockfield/meteor-package-loader
  api.add_files('server/cpu.coffee', 'server');
  api.add_files('server/load_avg.coffee', 'server');
  api.add_files('server/memory.coffee', 'server');
  api.add_files('server/server_stats.coffee', 'server');
  api.add_files('server/uptime.coffee', 'server');
  api.add_files('server/versions.coffee', 'server');

});
