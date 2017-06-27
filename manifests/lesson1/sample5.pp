class ppt_lesson::lesson1::sample5 {

  # fileリソースの使い方
  # https://docs.puppet.com/puppet/latest/types/file.html
  #
  file { '/tmp/test.txt':
    ensure	=> present,
    source 	=> [
      "puppet:///modules/ppt_lesson/test.txt.${host}",
      "puppet:///modules/ppt_lesson/test.txt.${operatingsystem}",
      "puppet:///modules/ppt_lesson/test.txt"
    ]
    mode	=> "0777",
    owner	=> "puppet",
    group	=> "puppet",
  }

}
