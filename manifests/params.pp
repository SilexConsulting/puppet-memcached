# == Class memcached::params
#
# This class is meant to be called from memcached
# It sets variables according to platform
#
class memcached::params {
  $port           = 11211
  $memory         = 128
  $listen         = false
  $connections    = 1024
  $package_name   = 'memcached'
  $service_name   = 'memcached'

  case $::osfamily {
    'Debian': {
      $config_path    = "/etc"
      $template_file  = 'memcached/memcached.conf.erb'
    }
    'RedHat', 'Amazon': {
      $config_path    = '/etc/sysconfig'
      $template_file  = 'memcached/memcached.redhat.erb'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
