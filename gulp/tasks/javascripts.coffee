gulp   = require("gulp")
coffee = require("gulp-coffee")

gulp.task "javascripts", ->
  gulp.src("./source/internuncio.coffee")
    .pipe(coffee())
    .pipe(gulp.dest("./"))
