class profile::unix::files (
  $config   = undef,
  $sys_schedule = 'always',
) {
  $defaults = {
    ensure   => 'present',
    schedule => $sys_schedule,
  }
  if $config {
    create_resources(file, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('profile::unix::files', undef)
    if $hiera_config {
      create_resources(file, $hiera_config, $defaults)
    }
  }
}
