# == Class memcached::service
#
# This class is meant to be called from memcached
# It ensure the service is running
#
class memcached::service {
  include memcached::params

  service { $memcached::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
