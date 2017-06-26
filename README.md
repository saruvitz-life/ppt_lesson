# Puppetの演習
## Lesson 1 モジュールを準備する
公式のインストール手順に従い、Puppetのパッケージをインストールしてください。  
https://docs.puppet.com/puppet/4.10/install_pre.html

次に演習を始める前に、演習で使用するモジュールを準備しましょう。  
モジュールの配置先の情報を確認してみましょう。  
~~~~
# puppet config print | grep module
module_repository = https://forgeapi.puppetlabs.com
module_skeleton_dir = /var/lib/puppet/puppet-module/skeleton
module_groups =
modulepath = /etc/puppet/modules:/usr/share/puppet/modules
module_working_dir = /var/lib/puppet/puppet-module
basemodulepath = /etc/puppet/modules:/usr/share/puppet/modules
# puppet module list | grep ppt_lesson
#
~~~~
モジュールの配置先を確認したら、以下のコマンドでモジュールを展開してみましょう。  
通常 puppet module install を使用しますが、今回の演習では git を使用して配置します。  
モジュールが展開されると、/etc/puppet/modules/ppt_lessonのディレクトリが作成されます。  
~~~~
# git clone https://github.com/saruvitz-life/ppt_lesson.git
Initialized empty Git repository in /etc/puppet/modules/ppt_lesson/.git/
remote: Counting objects: 91, done.
remote: Compressing objects: 100% (64/64), done.
remote: Total 91 (delta 29), reused 56 (delta 14), pack-reused 0
Unpacking objects: 100% (91/91), done.  

~~~~
モジュールを配置したら、以下のコマンドでモジュールを確認してみましょう。  
モジュールの情報が表示されると思います。  
~~~~
# puppet module list | grep Lesson
├ Puppet Beginners Lesson (v1.1.0)
~~~~
それではマニフェストを1つ適用してみましょう。  
マニフェストが適用されると、/tmp/test.txt が作成されます。  
~~~~
puppet apply /etc/puppet/modules/ppt_lesson/manifests/test1.pp
Notice: Compiled catalog for ******.******.co.jp in environment production in 0.10 seconds
Notice: /Stage[main]/Ppt_lesson::Lesson1::Sample1/File[/tmp/test.txt]/ensure: defined content as '{md5}3e25960a79dbc69b674cd4ec67a72c62'
Notice: Finished catalog run in 0.32 seconds
Notice: //******.******.co.jp//Stage[main]/Ppt_lesson::Lesson1::Sample1/File[/tmp/test.txt]/ensure: defined content as '{md5}3e25960a79dbc69b674cd4ec67a72c62'
Notice: //******.******.co.jp/Puppet: Finished catalog run in 0.32 seconds
#

~~~~
