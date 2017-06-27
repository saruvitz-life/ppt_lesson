class ppt_lesson {

  # init.pp
  # <モジュールpath>/<モジュール名>/manifests/init.pp
  #
  include ppt_lesson::lesson1 
  include ppt_lesson::lesson1::sample1

}
