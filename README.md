# PUPPETの演習
## モジュールを準備する
公式のインストール手順に従い、Puppetのパッケージをインストールしてください。  
https://docs.puppet.com/puppet/4.10/install_pre.html

演習を始める前に、演習で使用するモジュールを準備しましょう。  
モジュールの配置先の情報を確認してみましょう。  
~~~~
# puppet config print | grep module
module_repository = https://forgeapi.puppetlabs.com
module_skeleton_dir = /var/lib/puppet/puppet-module/skeleton
module_groups =
modulepath = /etc/puppet/modules:/usr/share/puppet/modules
module_working_dir = /var/lib/puppet/puppet-module
basemodulepath = /etc/puppet/modules:/usr/share/puppet/modules

# cd /etc/puppet/modules

※リモート側からクローンを作成する場合(初回)
# git clone https://github.com/saruvitz-life/ppt_lesson.git
Initialized empty Git repository in /etc/puppet/modules/ppt_lesson/.git/
remote: Counting objects: 91, done.
remote: Compressing objects: 100% (64/64), done.
remote: Total 91 (delta 29), reused 56 (delta 14), pack-reused 0
Unpacking objects: 100% (91/91), done.  

※リモート側からローカル側に同期する場合
# git fetch origin
# git reset --hard origin/master

※モジュールの設定情報を確認します。
# puppet module list | grep ppt_lesson
├ Puppet Beginners Lesson (v1.1.0)

~~~~
それではマニフェストを1つ適用してみましょう。  
マニフェストが適用されると、/tmp/test.txt が作成されます。  
~~~~
# puppet apply /etc/puppet/modules/ppt_lesson/manifests/test1.pp
Notice: Compiled catalog for ******.******.co.jp in environment production in 0.10 seconds
Notice: /Stage[main]/Ppt_lesson::Lesson1::Sample1/File[/tmp/test.txt]/ensure: defined content as '{md5}3e25960a79dbc69b674cd4ec67a72c62'
Notice: Finished catalog run in 0.32 seconds
Notice: //******.******.co.jp//Stage[main]/Ppt_lesson::Lesson1::Sample1/File[/tmp/test.txt]/ensure: defined content as '{md5}3e25960a79dbc69b674cd4ec67a72c62'
Notice: //******.******.co.jp/Puppet: Finished catalog run in 0.32 seconds
#

~~~~

これで演習の準備は完了です。
引き続き、以下のドキュメントではサンプルを用意し、実際の設定自動化を紹介します。
Lesson1.md
Lesson2.md
Lesson3.md
Lesson4.md
