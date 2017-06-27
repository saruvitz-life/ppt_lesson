class ppt_lesson::lesson1::sample1 {

  # fileリソースの使い方
  # https://docs.puppet.com/puppet/latest/types/file.html
  # 
  # 説明：
  # このマニフェストはごく初歩的なマニフェストです。
  # とくにクラス名とファイルの配置位置に気を付けて確認してみましょう。
  #
  file { '/tmp/test.txt':
    content => "Hello world"
  }

}
