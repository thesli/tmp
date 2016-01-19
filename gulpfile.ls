require!{
  'gulp': gulp
  'webpack-stream': webpackStream
  'gulp-postcss': postcss
  'gulp-plumber': plumber
  'gulp-clean': clean
  'gulp-watch': watch
  'gulp-livescript': livescript
  'gulp-sourcemaps': sourcemap
  'gulp-notify': notify
  'gulp-nodemon': nodemon

  'webpack-stream': webpackStream
  'browser-sync': BrowserSync
  'path'
}

# process.on 'uncaughtException', ->
#   process.exit!

[src,dest,task] = ['src','dest','task'].map -> gulp~[&0]
global<<< {+__watch__}
{Config} = require "./config/"

task 'webpack', ->
  src("#{__dirname}/src/client/entry.ls")
  .pipe plumber!
  .pipe webpackStream Config.webpack
  .pipe dest('./build/client/bundle')

task 'clean', ->
  src('./build/')
  .pipe clean!

task 'browser-sync', ->
  option = {
    files: ['./build/client/']
    proxy: 'localhost:4000'
    port: 3000
    loglevel: "silent"
    reloadDelay: 500
    -logFileChanges
    -open
    -ui
  }
  BrowserSync option

task 'postcss', ->
  do compile =  ->
    src("#{__dirname}/src/client/util/style.css")
    .pipe plumber!
    .pipe postcss(Config.postcss)
    .pipe dest("#{__dirname}/build/client/bundle")
  watch "#{__dirname}/src/client/**/*.css", ({path}:file) ->
    compile path

task 'nodemon', ->
  nodemonInstance = nodemon Config.nodemon

task 'livescript', ->
  do compile = (path = "#{__dirname}/src/**/*.ls") ->
    src(path, {base: "#{__dirname}/src/"})
    .pipe plumber!
    .pipe sourcemap.init!
    .pipe livescript!
    .pipe sourcemap.write '.'
    .pipe dest("#{__dirname}/build/")

  watch "#{__dirname}/src/**/*.ls", ({path}:file) ->
    compile path

task 'dev', ['webpack','postcss','livescript','nodemon','browser-sync']
