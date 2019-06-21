class profile::unix::users (
  $config   = undef,
  $sys_schedule = 'always',
  $real     = false,
) {
  $defaults = {
    ensure   => 'present',
    schedule => $sys_schedule,
    shell    => '/bin/bash',
  }
  if $real {
    $type = 'user'
  }
  else {
    $type = '@user'
  }
  if $config {
    create_resources($type, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('profile::unix::users', undef)
    if $hiera_config {
       create_resources($type, $hiera_config, $defaults)
    }
  }
}
