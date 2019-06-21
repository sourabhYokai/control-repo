class profile::unix::yumgroups (
  $config   = undef,
  $sys_schedule = 'always',
) {
  $defaults = {
    ensure   => 'present',
    schedule => $sys_schedule,
  }
  if $config {
    create_resources('profile::unix::yumgroup', $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('profile::unix::yumgroups', undef)
    if $hiera_config {
      create_resources('profile::unix::yumgroup', $hiera_config, $defaults)
    }
  }
}
