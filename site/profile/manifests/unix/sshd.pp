class profile::unix::sshd (
  $config   = undef,
  $sys_schedule = 'always',
  $sync_host_keys = true
) {
  $defaults = {
    schedule => $sys_schedule,
  }
  if $config {
    include augeasproviders
    create_resources(sshd_config, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('profile::unix::sshd', undef)
    if $hiera_config {
      include augeasproviders
      create_resources(sshd_config, $hiera_config, $defaults)
    }
  }
  if $sync_host_keys {
    # From: http://docs.puppetlabs.com/guides/exported_resources.html
    # and https://wiki.xkyle.com/Managing_SSH_Keys_With_Puppet

    # export host key
    $hostonly = regsubst($::fqdn, "\\.${::domain}$", '')
    $host_aliases = [ $::ipaddress, $hostonly ]
    @@sshkey { $::fqdn:
      ensure       => present,
      host_aliases => $host_aliases,
      type         => 'rsa',
      key          => $::sshrsakey,
    }

    # import all other host keys
    Sshkey <<| |>>
  }
}
