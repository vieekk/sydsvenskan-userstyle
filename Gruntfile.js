module.exports = function (grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        cssmin: {
            dist: {
                src: ['src/<%= pkg.name %>.css'],
                dest: 'dist/<%= pkg.name %>.min.css'
            }
        },
        concat: {
            dist: {
                options: {
                    banner: '/*! <%= pkg.title %> v<%= pkg.version %> | (C) 2013, 2014 vikekh | http://www.gnu.org/licenses/gpl-3.0.txt */',
                    process: function (src, path) {
                        return '@-moz-document domain("sydsvenskan.se"){' + src + '}';
                    }
                },
                src: ['dist/<%= pkg.name %>.min.css'],
                dest: 'dist/<%= pkg.name %>.min.css'
            }
        },
        replace: {
            dist: {
                src: ['dist/<%= pkg.name %>.min.css'],
                dest: 'dist/<%= pkg.name %>.min.css',
                replacements: [{
                    from: '$version',
                    to: '<%= pkg.version %>'
                }]
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-text-replace');

    grunt.registerTask('default', ['cssmin', 'concat', 'replace']);

};