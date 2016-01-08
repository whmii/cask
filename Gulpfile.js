var gulp = require("gulp"),
  autoprefix = require("gulp-autoprefixer"),
  sass = require("gulp-sass"),
  connect = require("gulp-connect"),
  bourbon = require("node-bourbon").includePaths,
  haml = require('gulp-ruby-haml');;

var paths = {
  scss: ["./app/assets/stylesheets/**/*.scss",
  "./contrib/stylesheets/*.scss"],
  haml: './contrib/views/*.haml'
};

gulp.task("sass", function () {
  return gulp.src(paths.scss)
    .pipe(sass({
      includePaths: ["/styles"].concat(bourbon)
    }))
    .pipe(autoprefix("last 2 versions"))
    .pipe(gulp.dest("./contrib"))
    .pipe(connect.reload());
});

gulp.task('haml', function () {
  gulp.src(paths.haml)
    .pipe(haml())
    .pipe(gulp.dest('./contrib'));
});

gulp.task("connect", function() {
  connect.server({
    root: "contrib",
    port: 8000,
    livereload: true
  });
});

gulp.task("default", ["sass", "haml", "connect"], function() {
  gulp.watch(paths.scss, ["sass"]);
  gulp.watch(paths.haml, ["haml"]);
});
