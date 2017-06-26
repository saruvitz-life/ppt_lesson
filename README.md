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
Puppetでは、モジュールのインストールに puppet module install を使用しますが、
今回の演習では git を使用することにします。  
モジュールが展開されると、/etc/puppet/modules/ppt_lessonの
ディレクトリがあることを確認してください。  
~~~~
# git
#
~~~~
モジュールを配置したら、以下のコマンドでマニフェストを適用してみましょう。  
実際の適用にはエージェントなどを使用しますので、  
~~~~
# puppet apply /etc/puppet/modules/ppt_lesson/manifests/lesson1/sample1.pp


~~~~
