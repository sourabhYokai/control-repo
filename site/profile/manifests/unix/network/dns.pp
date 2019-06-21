class profile::unix::network::dns (
  $config = undef,
) {
  if $config {
    validate_hash($config)
    $_config = $config
  }
  else {
    $_config = hiera_hash('profile::unix::network::dns', undef)
  }
  if $_config {
    $domains     = $_config['domains']
    $nameservers = $_config['nameservers']
    $options     = $_config['options']
    validate_array($domains)
    validate_array($nameservers)
    validate_array($options)
    file { '/etc/resolv.conf':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('profile::unix/network/dns.erb'),
    }
  }
}
#profile::unix::network::dns:
#  nameservers: [ '10.7.96.2'  ]
#  domains:     [ 'domain.com' ]
