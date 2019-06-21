class profile::unix::network (
  $hostname     = undef,
  $gateway      = undef,
  $ipv6         = false,
  $ipv6init     = false,
  $ipv6autoconf = true,
  $zeroconf     = false,
) {
  if $hostname {
    validate_string($hostname)
    if ! is_ip_address($gateway) {
      fail('profile::unix::network::gateway must be an IP address')
    }
    validate_bool($ipv6)
    validate_bool($zeroconf)
    file { '/etc/sysconfig/network':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('profile::unix/network/network.erb'),
    }
    include ::profile::unix::network::dns
    include ::profile::unix::network::interfaces
    include ::profile::unix::network::service
  }
}
