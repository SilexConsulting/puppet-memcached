# == Class: memcached
#
# Full description of class memcached here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class memcached (
  $port           = $memcached::params::port,
  $memory         = $memcached::params::memory,
  $listen         = $memcached::params::listen,
  $connections    = $memcached::params::connections,
) inherits memcached::params {

  # validate parameters here

  class { 'memcached::install': } ->
  memcached::config {'default':
    port        => $port,
    memory      => $memory,
    listen      => $listen,
    connections => $connections,
  } ~>
  class { 'memcached::service': }

}
