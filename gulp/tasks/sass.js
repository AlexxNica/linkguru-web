var gulp = require('gulp');
var sass = require('gulp-sass');
var minifyCSS = require('gulp-minify-css');

gulp.task('sass', function () {
  return gulp.src('./src/scss/app.scss')
    .pipe(sass())
    .pipe(minifyCSS({processImport: true, keepBreaks: true}))
    .pipe(gulp.dest('./build'));
});

