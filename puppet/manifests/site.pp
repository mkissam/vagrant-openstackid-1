include '::mysql::server'

$redis_port = '6378'
$redis_max_memory = '512mb'
$redis_bind = '127.0.0.1'
$redis_password = 's3cr3t'

exec { "apt-update":
  command => "/usr/bin/apt-get update",
  onlyif => "/bin/sh -c '[ ! -f /var/cache/apt/pkgcache.bin ] || /usr/bin/find /etc/apt/* -cnewer /var/cache/apt/pkgcache.bin | /bin/grep . > /dev/null'",
}

Exec["apt-update"] -> Package <| |>

mysql::db { 'openstackid':
  user     => 'openstackid',
  password => 's3cr3t',
  host     => 'localhost',
}

mysql::db { 'os_members':
  user     => 'openstackid',
  password => 's3cr3t',
  host     => 'localhost',
}

class { 'redis':
  redis_port       => $redis_port,
  redis_max_memory => $redis_max_memory,
  redis_bind       => $redis_bind,
  redis_password   => $redis_password,
}

class { 'openstackid':
  id_mysql_host     => 'localhost',
  id_mysql_user     => 'openstackid',
  id_mysql_password => 's3cr3t',
  id_db_name        => 'openstackid',
  ss_mysql_host     => 'localhost',
  ss_mysql_user     => 'openstackid',
  ss_mysql_password => 's3cr3t',
  ss_db_name        => 'os_members',
  redis_port        => $redis_port,
  redis_host        => $redis_bind,
  redis_password    => $redis_password,
  id_log_error_to_email   => 'marton.kiss@gmail.com',
  id_log_error_from_email => 'marton.kiss@gmail.com',
  require   => [ Mysql::Db['openstackid'], Mysql::Db['os_members'], Class['redis'] ],
}

