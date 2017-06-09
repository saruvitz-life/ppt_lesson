class ppt_lesson::setting_oracle_client {

  # biemond/oradb モジュールの使用例です。
　# https://forge.puppet.com/biemond/oradb
  # 
  # パッケージは /etc/puppet/files/oracle/software/linux.x64_11gR2_client.zip に配置します。
  # Oracleのインストールに必要なユーザーも、事前構成として準備してあげるのが望ましい。
  #
  oradb::client{ '11.2.0.1_Linux-x86-64':
    version                   => '11.2.0.1',
    file                      => 'linux.x64_11gR2_client.zip',
    oracle_base               => '/oracle',
    oracle_home               => '/oracle/product/11.2/client',
    user                      => 'oracle',
    group                     => 'dba',
    group_install             => 'oinstall',
    download_dir              => '/install',
    bash_profile              => true,
    remote_file               => true,
    puppet_download_mnt_point => "puppet:///extra_files/oracle/software",
    logoutput                 => true,
  }
  
  #インストール要件に必要なパッケージの追加
  #
  $install = [ 'binutils.x86_64', 'glibc.x86_64','ksh.x86_64','libaio.x86_64',
             'libgcc.x86_64', 'libstdc++.x86_64', 'make.x86_64','compat-libcap1.x86_64', 'gcc.x86_64',
             'gcc-c++.x86_64','glibc-devel.x86_64','libaio-devel.x86_64','libstdc++-devel.x86_64',
             'sysstat.x86_64','unixODBC-devel','glibc.i686','libXext.x86_64','libXtst.x86_64']
  package { $install:
    ensure  => present,
  }

}
