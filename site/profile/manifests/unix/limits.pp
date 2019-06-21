class profile::unix::limits (
  $config   = undef,
  $sys_schedule = 'always',
) {
  if $config {
    include limits
    class { 'limits':
      config    => $config,
      use_hiera => false,
      #schedule => $sys_schedule,
    }
  }
  else {
    $hiera_config = hiera_hash('profile::unix::limits', undef)
    if $hiera_config {
      include limits
      class { 'limits':
        config    => $hiera_config,
        use_hiera => false,
        #schedule => $sys_schedule,
      }
    }
  }
}
