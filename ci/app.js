var exec = require('child_process').exec;

exports.handler = function(event, context, callback) {
  exec('/opt/bin/tor --version', function(error, stdout, stderr) {
      if (stdout === "Tor version 0.4.0.5.\n") {
          callback(null, "pass test");
      } else {
          callback(new Error("version mismatch"));
      }
  });
}
