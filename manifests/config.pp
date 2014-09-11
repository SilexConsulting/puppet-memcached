# == Class memcached::config
#
# This class is called from memcached
#
define memcached::config(
  $port           = 11211,
  $memory         = 128,
  $listen         = false,
  $connections    = 1024,
) {

  case $::osfamily {
    'Debian': {
      $config_file    = "${memcached::params::config_path}/memcached_${name}.conf"
    }
    'RedHat', 'Amazon': {
      $config_file    = "${memcached::params::config_path}/memcached"
    }
  }

  file { $config_file:
    content => template($memcached::params::template_file),
  }
}
