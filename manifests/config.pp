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
  file { "/etc/memcached_${name}.conf":
    content => template('memcached/memcached.conf.erb'),
  }
}
