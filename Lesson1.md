# Lesson1の演習
## sample1.pp
このモジュールはfileリソースを使用し、/tmp/test1.txtを作成します。  
~~~~
#   

~~~~
## sample2.pp
このモジュールは、/tmp/test1.txtに出力するテキストをパラメータとして引き渡すサンプルです。 
~~~~
# 

~~~~
## sample3.pp
このモジュールは、factから情報を取得し、環境ごとに/tmp/test1.txtを出力するサンプルです。 
~~~~
# 

~~~~
## sample4.pp
このモジュールは、ファイルが存在する場合にファイルを取り消すサンプルです。 
~~~~
# 

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
