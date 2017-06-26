class ppt_lesson::lesson1::sample4 {

  # fileリソースの使い方
  # https://docs.puppet.com/puppet/latest/types/file.html
  #
  file { '/tmp/test.txt':
    ensure	=> absent
  }

}
