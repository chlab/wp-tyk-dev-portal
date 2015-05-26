/*

 to install gulp at all:
 > sudo npm install -g gulp

 to install in the project:
 > sudo npm install --save-dev gulp

 than run

 > sudo npm install gulp-ruby-sass gulp-autoprefixer gulp-minify-css gulp-concat gulp-uglify gulp-clean gulp-notify gulp-cache gulp-util gulp-watch --save-dev

 */

var gulp = require('gulp'),
    sass = require('gulp-ruby-sass'),
    watch = require('gulp-watch'),
    concat = require('gulp-concat'),
    notify = require('gulp-notify'),
    minifycss = require('gulp-minify-css'),
    autoprefixer = require('gulp-autoprefixer');


gulp.task('default', function(){});

// sass task
gulp.task('sass', function () {
    gulp.src('./assets/scss/app.scss')
        .pipe(sass({
            noCache: true,
            style: "compressed",
            lineNumbers: false,
            loadPath: './assets/scss/*'
        }))
        .pipe(minifycss())
        .pipe(autoprefixer('last 2 version'))
        .pipe(concat('app.css'))
        .pipe(gulp.dest('./assets/css'))
        .pipe(notify({ message: 'Styles task complete' }));
});


gulp.task('scripts', function() {
    gulp.src([
        './assets/js/app.js'
    ])
        .pipe(concat('app.min.js'))
        .pipe(gulp.dest('./assets/js'))
        .pipe(notify({ message: 'Scripts task complete' }));
});


gulp.task('watch', function() {
    gulp.watch('./assets/scss/**/*.scss', ['sass'] );
    gulp.watch('./assets/js/**/*.js', ['scripts'] );
});