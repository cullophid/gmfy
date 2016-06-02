{replace, map, head} = require 'ramda'
assert = require 'assert'
fs = require 'fs'
spawn = require 'child_process' .spawn

commander = require 'commander'
commander
  .version('0.0.1')
  .usage('[options] <pattern>')
  .option('-w, --watch', 'Watch files')
  .parse(process.argv);

runTest = (file) ->
  ls = spawn('lsc', [file]);
  ls.stdout.pipe(process.stdout)
  ls.stderr.pipe(process.stderr)


files = commander.args
console.log 'watching files', files
if commander.watch
  files
    .forEach (file) ->
      onChange = -> runTest file
      fs.watch file, onChange
      fs.watch (replace '.test.ls', '.ls', file), onChange
else
  files
    .forEach (file) ->
      require "./#{file}"
