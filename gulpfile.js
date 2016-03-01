'use strict';
var path = require('path');
var gulp = require('gulp');
var mocha = require('gulp-mocha');
var nsp = require('gulp-nsp');
var plumber = require('gulp-plumber');var coveralls = require('gulp-coveralls');

gulp.task('nsp', function (cb) {
  nsp({package: path.resolve('package.json')}, cb);
});

gulp.task('test', function (cb) {
  var mochaErr;

  gulp.src('generator-test/**/*.js')
      .pipe(plumber())
      .pipe(mocha({reporter: 'spec', timeout: 5000}))
      .on('error', function (err) {
        mochaErr = err;
      })
      .on('end', function () {
        cb(mochaErr);
      });
});

gulp.task('default', ['test']);
