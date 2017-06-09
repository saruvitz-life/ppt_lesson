class ppt_lesson::lesson1::sample4 {

  # fileリソースの使い方
  # https://docs.puppet.com/puppet/latest/types/file.html
  # 
  # 説明：
  # ホスト名→OS→デフォルトの順でFactを照合し、環境別にファイルを設定します。
  # 予め環境別のファイルを用意しておく必要があります。
  # この例は利用サンプルの１例です。実際のマニフェストでは template を使用するケースが多いです。
  #
  # 使用できるfactは、以下のコマンドで確認できます。
  #
  # ■Linux1 ※RedHat系のfactorコマンドとは別ものなので注意
  # # facter -p
  #
  # ■Windows
  # C:\Program Files\Puppet Labs\Puppet\bin> facter -p
  #
  file { '/tmp/test.txt':
    source => [
      "puppet:///modules/ppt_lesson/test.txt.${host}",
      "puppet:///modules/ppt_lesson/test.txt.conf.${operatingsystem}",
      "puppet:///modules/ppt_lesson/test.txt.conf"
    ]
  }

}
