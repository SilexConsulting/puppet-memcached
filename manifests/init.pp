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
  $port           = 11211,
  $memory         = 128,
  $listen         = false,
  $connections    = 1024,
) inherits memcached::params {

  # validate parameters here

  class { 'memcached::install': } ->
  memcached::config {'default':
    port        => $port,
    memory      => $memory,
    listen      => $listen,
    connections => $connections,
  } ~>
  class {"memcached::service": }


}
