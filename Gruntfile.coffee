module.exports = (grunt) ->
  grunt.initConfig
    builddir: 'public'
    pkg: grunt.file.readJSON('package.json')
    coffee:
      compile:
        files:
          'public/md4drive/md4drive.js': 'controllers/**/*.coffee'
    watch:
      scripts:
        files: ['controllers/**/*.coffee', 'views/**/*.jade']
        tasks: 'build'
        options:
          interrupt: true
    jade:
      compile:
        files:
          'public/index.html': 'views/index.jade'
          'public/editor.html': 'views/editor.jade'
    coffeelint:
      app: ['controllers/**/*.coffee']

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jade'

  grunt.registerTask 'default', ['coffeelint', 'build']

  grunt.registerTask 'build', ->
    grunt.task.run 'jade'
    grunt.task.run 'coffee'