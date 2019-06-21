class profile::unix::groups (
  $config   = undef,
  $sys_schedule = 'always',
  $real     = false,
) {
  $defaults = {
    ensure   => 'present',
    schedule => $sys_schedule,
  }
  if $real {
    $type = 'group'
  }
  else {
    $type = '@group'
  }
  if $config {
     create_resources($type, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('profile::unix::groups', undef)
    if $hiera_config {
      create_resources($type, $hiera_config, $defaults)
    }
  }
}
