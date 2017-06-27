class ppt_lesson::lesson1::sample6 {

  # fileリソースの使い方
  # https://docs.puppet.com/puppet/latest/types/file.html
  #
  case $facts['os']['name'] {
    'windows':           { $test_path = "C:\temp\" }
    'RedHat', 'CentOS':  { $test_path = "/tmp/"  }
    /^(Debian|Ubuntu)$/: { $test_path = "/tmp/"  }
    default:             { $test_path = "/tmp/" }
  }

  file { '${test_path}test.txt':
    ensure	=> present,
    source 	=> [
      "puppet:///modules/ppt_lesson/test.txt.${host}",
      "puppet:///modules/ppt_lesson/test.txt.${operatingsystem}",
      "puppet:///modules/ppt_lesson/test.txt"
    ],
    mode	=> "0644",
    owner	=> "puppet",
    group	=> "puppet",
  }

}
