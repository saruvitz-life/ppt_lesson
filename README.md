# Puppet演習
Puppet Lesson 1
この演習を始める前に、モジュールの配置先を確認してみましょう。
~~~~
# puppet config print | grep module
module_repository = https://forgeapi.puppetlabs.com
module_skeleton_dir = /var/lib/puppet/puppet-module/skeleton
module_groups =
modulepath = /etc/puppet/modules:/usr/share/puppet/modules
module_working_dir = /var/lib/puppet/puppet-module
basemodulepath = /etc/puppet/modules:/usr/share/puppet/modules
#
~~~~
モジュールの配置先を確認したら、以下のコマンドでモジュールを展開してみましょう。
Puppetでは、モジュールのインストールに puppet module install を使用しますが、
今回の演習では git を使用することにします。
モジュールが展開されると、/etc/puppet/modules/ppt_lessonの
ディレクトリがあることを確認してください。
