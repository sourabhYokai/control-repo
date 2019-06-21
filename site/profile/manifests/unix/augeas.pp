class profile::unix::augeas (
  $config   = undef,
  $sys_schedule = 'always',
) {
  $defaults = {
    schedule => $sys_schedule,
  }
  if $config {
    create_resources(augeas, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('profile::unix::augeas', undef)
    if $hiera_config {
      create_resources(augeas, $hiera_config, $defaults)
    }
  }
}
