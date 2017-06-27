# Lesson1の演習
## sample1.pp
このモジュールはfileリソースを使用し、/tmp/test1.txtを作成します。  
~~~~
# cat /etc/puppet/modules/ppt_lesson/manifests/lesson1/sample1.pp
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

※上記のモジュールを使用するマニフェストを、以下のとおり作成します。
# cat /etc/puppet/modules/ppt_lesson/manifests/test1.pp
include ppt_lesson::lesson1::sample1

※マニフェストは、以下のように記述することもできます。
# cat /etc/puppet/modules/ppt_lesson/manifests/test1.pp
class { 'ppt_lesson::lesson1::sample1': }

※以下のコマンドを実行すると、/tmp/test.txtが作成されます。
# puppet apply /etc/puppet/modules/ppt_lesson/manifests/test1.pp
Notice: Compiled catalog for server1 in environment production in 0.09 seconds
Notice: /Stage[main]/Ppt_lesson::Lesson1::Sample1/File[/tmp/test.txt]/ensure: defined content as '{md5}3e25960a79dbc69b674cd4ec67a72c62'
Notice: Finished catalog run in 0.33 seconds
Notice: //server1//Stage[main]/Ppt_lesson::Lesson1::Sample1/File[/tmp/test.txt]/ensure: defined content as '{md5}3e25960a79dbc69b674cd4ec67a72c62'
Notice: //server1/Puppet: Finished catalog run in 0.33 seconds

※２度目を実行すると、今度は何もおこなわれません。
# puppet apply /etc/puppet/modules/ppt_lesson/manifests/test1.pp
Notice: Compiled catalog for server1 in environment production in 0.09 seconds
Notice: Finished catalog run in 0.36 seconds
Notice: //server1/Puppet: Finished catalog run in 0.36 seconds

~~~~
## sample2.pp
このモジュールは、/tmp/test1.txtに出力するテキストをパラメータとして引き渡すサンプルです。 
~~~~
# cat /etc/puppet/modules/ppt_lesson/manifests/lesson1/sample2.pp
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

※上記のモジュールを使用するマニフェストを、以下のとおり作成します。
# cat/etc/puppet/modules/ppt_lesson/manifests/test2.pp
class { 'ppt_lesson::lesson1::sample2': {
  msg	=> "こんにちは"
}

※実行すると、/tmp/test.txtのメッセージの内容が更新されます。
# puppet apply /etc/puppet/modules/ppt_lesson/manifests/test2.pp
~~~~
## sample3.pp
このモジュールは、factから情報を取得し、環境ごとに/tmp/test.txtを出力するサンプルです。 
~~~~
# cat /etc/puppet/modules/ppt_lesson/manifests/lesson1/sample3.pp
class ppt_lesson::lesson1::sample3 {

  # fileリソースの使い方
  # https://docs.puppet.com/puppet/latest/types/file.html
  # 
  # 説明：
  # ホスト名→OS→デフォルトの順でFactを照合し、環境別にファイルを設定します。
  # 予め環境別のファイルを用意しておく必要があります。
  # この例は利用サンプルの１例です。実際のマニフェストでは template を使用するケースが多いです。
  #
  file { '/tmp/test.txt':
    source => [
      "puppet:///modules/ppt_lesson/test.txt.${host}",
      "puppet:///modules/ppt_lesson/test.txt.${operatingsystem}",
      "puppet:///modules/ppt_lesson/test.txt"
    ]
  }

} 

※実行すると、環境ごとに異なる/tmp/test.txtのメッセージの内容が更新されます。  
※このマニフェストをWindows環境で実行した場合、ファイルのパスが存在しないためエラーとなります。
# puppet apply /etc/puppet/modules/ppt_lesson/manifests/test3.pp
~~~~
## sample4.pp
このモジュールは、ファイルが存在する場合にファイルを取り消すサンプルです。 
~~~~
# cat /etc/puppet/modules/ppt_lesson/manifests/lesson1/sample4.pp
class ppt_lesson::lesson1::sample4 {

  # fileリソースの使い方
  # https://docs.puppet.com/puppet/latest/types/file.html
  #
  file { '/tmp/test.txt':
    ensure	=> absent
  }

}

# puppet apply /etc/puppet/modules/ppt_lesson/manifests/test4.pp
Notice: Compiled catalog for server1 in environment production in 0.11 seconds
Notice: /Stage[main]/Ppt_lesson::Lesson1::Sample4/File[/tmp/test.txt]/ensure: removed
Notice: Finished catalog run in 0.46 seconds
Notice: //server1//Stage[main]/Ppt_lesson::Lesson1::Sample4/File[/tmp/test.txt]/ensure: removed
Notice: //server1/Puppet: Finished catalog run in 0.46 seconds 

~~~~
## sample5.pp
このモジュールは、環境ごとに異なる/tmp/test.txtファイルを作成し、所有者、グループ、パーミッションを変更します。 
~~~~
# cat /etc/puppet/modules/ppt_lesson/manifests/lesson1/sample5.pp
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
    ],
    mode	=> "0644",
    owner	=> "puppet",
    group	=> "puppet",
  }

}

※実行すると、/tmp/test.txtが作成され、所有者:puppet、グループ:puppet、パーミッション:644が設定されます。
# puppet apply /etc/puppet/modules/ppt_lesson/manifests/test5.pp

~~~~

## factの確認
以下のコマンドを実行し、Puppetで使用できるfactを確認してみましょう。
### Linux
~~~~
# facter -p

~~~~
### Windows
~~~~
C:\Program Files\Puppet Labs\Puppet\bin> facter -p

~~~~ 
