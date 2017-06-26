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
Puppetのモジュールのインストールには、通常 puppet module install を使用しますが、
今回の演習では git を使用して配置します。  
モジュールが展開されると、/etc/puppet/modules/ppt_lessonの
ディレクトリがあることを確認してください。  
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
tqq Puppet Beginners Lesson (v1.1.0)
~~~~
次に site.pp を作成します。  
site.ppからモジュールを読み出すようにします。。  
~~~~
# puppet apply /etc/puppet/modules/ppt_lesson/manifests/lesson1/sample1.pp
Notice: Compiled catalog for xxxxxx.domain.co.jp in environment production in 0.02 seconds
Notice: Finished catalog run in 0.36 seconds
Notice: //xxxxxx.domain.co.jp/Puppet: Finished catalog run in 0.36 seconds  

~~~~
