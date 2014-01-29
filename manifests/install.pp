# == Class memcached::install
#
class memcached::install {
  include memcached::params

  package { $memcached::params::package_name:
    ensure => present,
  } ->
  user { 'memcached':
    ensure => present,
    system => true,
  }
}
