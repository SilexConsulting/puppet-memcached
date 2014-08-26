# == Class memcached::params
#
# This class is meant to be called from memcached
# It sets variables according to platform
#
class memcached::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'memcached'
      $service_name = 'memcached'
      $config_file = "/etc/memcached_${name}.conf"
      $template_file = 'memcached/memcached.conf.erb'
    }
    'RedHat', 'Amazon': {
      $package_name = 'memcached'
      $service_name = 'memcached'
      $config_file = '/etc/sysconfig/memcached'
      $template_file = 'memcached/memcached.redhat.erb'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
