module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  SRC_PATH = 'src'
  DIST_PATH = 'dist'

  grunt.initConfig
    clean:
      all:
        ['dist']

    copy:
      dist:
        files: [
          {
            cwd: SRC_PATH
            expand: true
            src: ['**/*'],
            dest: DIST_PATH
          },
          {
            cwd: 'bower_components'
            expand: true
            flatten: true
            src: ['phaser-official/build/phaser.min.js']
            dest: "#{DIST_PATH}/js"
          }
        ]

    watch:
      html:
        files: ['src/**/*']
        tasks: ['copy:dist']

    connect:
      server:
        options:
          base: DIST_PATH
          livereload: true

  grunt.registerTask 'build', [
    'clean'
    'copy'
  ]

  grunt.registerTask 'default', [
    'build'
  ]

  grunt.registerTask 'serve', [
    'build'
    'connect:server'
    'watch'
  ]

