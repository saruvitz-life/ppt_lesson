class ppt_lesson::lesson1::sample2 (
  $msg = "Hello world."
)
{
  # fileリソースの使い方
  # https://docs.puppet.com/puppet/latest/types/file.html
  # 
  file { '/tmp/test.txt':
    contents => ${msg}
  }
}
