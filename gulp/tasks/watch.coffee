gulp = require("gulp")

tasks =
  "source/internuncio.coffee": ["javascripts"]

gulp.task "watch", ["build"], ->
  for match, task of tasks
    gulp.watch(match, task)
