class openstackid (
  $id_mysql_host = '',
  $id_mysql_user = '',
  $id_mysql_password = '',
  $id_db_name = '',
  $ss_mysql_host = '',
  $ss_mysql_user = '',
  $ss_mysql_password = '',
  $ss_db_name = '',
  $redis_port = '',
  $redis_host = '',
  $redis_password = '',
  $id_log_error_to_email = '',
  $id_log_error_from_email = '',
  $id_environment = 'dev',
  $id_hostname = 'openid-dev',
  $id_recaptcha_public_key = '',
  $id_recaptcha_private_key = '',
  $id_recaptcha_template = '',
  $vhost_name = 'openid-dev',
  $ssl_enable = 'true',
  $ssl_cert_file = '/etc/ssl/certs/ssl-cert-snakeoil.pem',
  $ssl_key_file = '/etc/ssl/private/ssl-cert-snakeoil.key',
  $ssl_chain_file = '',
  $ssl_cert_file_contents = '', # If left empty puppet will not create file.
  $ssl_key_file_contents = '', # If left empty puppet will not create file.
  $ssl_chain_file_contents = '', # If left empty puppet will not create file.
  $oauth2_enable = 'true',
) {

  include apache
  class {'apache::mod::php': }

  # the deploy scripts use the curl CLI
  package { 'curl':
    ensure => present,
  }

  package { 'git-core':
    ensure => present,
  }

  # php packages needed for openid server
  $php5_packages = [
    'php5-common',
    'php5-curl',
    'php5-cli',
    'php5-mcrypt',
    'php5-mysql',
  ]

  package { $php5_packages:
    ensure => present,
  }

  file { '/etc/openstackid':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/etc/openstackid/database.php':
    ensure  => present,
    content => template('openstackid/database.php.erb'),
    owner   => 'root',
    group   => 'www-data',
    mode    => '0640',
    require => [
      File['/etc/openstackid'],
    ]
  }

  file { '/etc/openstackid/log.php':
    ensure  => present,
    content => template('openstackid/log.php.erb'),
    owner   => 'root',
    group   => 'www-data',
    mode    => '0640',
    require => [
      File['/etc/openstackid'],
    ]
  }

  file { '/etc/openstackid/environment.php':
    ensure  => present,
    content => template('openstackid/environment.php.erb'),
    owner   => 'root',
    group   => 'www-data',
    mode    => '0640',
    require => [
      File['/etc/openstackid'],
    ]
  }

  file { '/etc/openstackid/server.php':
    ensure  => present,
    content => template('openstackid/server.php.erb'),
    owner   => 'root',
    group   => 'www-data',
    mode    => '0640',
    require => [
      File['/etc/openstackid'],
    ]
  }

  file { '/etc/openstackid/recaptcha.php':
    ensure  => present,
    content => template('openstackid/recaptcha.php.erb'),
    owner   => 'root',
    group   => 'www-data',
    mode    => '0640',
    require => [
      File['/etc/openstackid'],
    ]
  }

  $docroot_dirs = [ '/srv/openstackid' ]
  file { $docroot_dirs:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  file { '/srv/openstackid/deploy.sh':
    ensure  => present,
    source => 'puppet:///modules/openstackid/deploy.sh',
    owner   => 'root',
    group   => 'root',
    mode    => '0775',
    require => [
      File[$docroot_dirs],
    ]
  }

  if $ssl_cert_file_contents != '' {
    file { $ssl_cert_file:
      owner   => 'root',
      group   => 'root',
      mode    => '0640',
      content => $ssl_cert_file_contents,
      before  => Service['httpd'],
    }
  }

  if $ssl_key_file_contents != '' {
    file { $ssl_key_file:
      owner   => 'root',
      group   => 'root',
      mode    => '0640',
      content => $ssl_key_file_contents,
      before  => Service['httpd'],
    }
  }

  if $ssl_chain_file_contents != '' {
    file { $ssl_chain_file:
      owner   => 'root',
      group   => 'root',
      mode    => '0640',
      content => $ssl_chain_file_contents,
      before  => Service['httpd'],
    }
  }

  a2mod { 'rewrite':
    ensure => present,
  }
  a2mod { 'ssl':
    ensure => present,
  }

  file { '/etc/apache2/conf.d/openstackid':
    ensure  => present,
    content => template('openstackid/openstackid.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['httpd'],
    before  => Service['httpd'],
  }

  exec { 'deploy-site':
    path      => '/usr/bin:/bin:/usr/local/bin',
    command   => '/srv/openstackid/deploy.sh',
    creates   => '/srv/openstackid/deploy.lock',
    logoutput => true,
    timeout   => 0,
    notify    => Service['httpd'],
    require   => [
      File[$docroot_dirs],
      File['/etc/openstackid/recaptcha.php'],
      File['/etc/openstackid/database.php'],
      File['/etc/openstackid/log.php'],
      File['/etc/openstackid/environment.php'],
      File['/etc/apache2/conf.d/openstackid'],
      Package['curl'],
      Package[$php5_packages] ],
  }
}