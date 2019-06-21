class profile::unix::network::interfaces (
  $config = undef,
) {
  if $config {
    $_config = $config
  }
  else {
    $_config = hiera_hash('profile::unix::network::interfaces', undef)
  }
  $defaults = {
  }
  create_resources('profile::unix::network::interface', $_config, $defaults)
}
#profile::unix::network::interfaces:
#  eth0:
#  dhcp:    'false' # default
#  hwaddr:  '00:50:56:AF:01:1A' # defaults to: macaddress_eth0
#  onboot:  'true' # default
#  hotplug: 'true' # default
#  type:    'Ethernet' # default
#  ipaddr:  '10.7.96.21'
#  netmask: '255.255.240.0'
