class profile::unix::mounts (
  $config   = undef,
  $sys_schedule = 'always',
) {
  $defaults = {
    atboot   => true,
    ensure   => 'mounted',
    schedule => $sys_schedule,
  }
  if $config {
    create_resources(mount, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('profile::unix::mounts', undef)
    if $hiera_config {
      create_resources(mount, $hiera_config, $defaults)
    }
  }
}
