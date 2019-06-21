class profile::unix::templates (
  $config   = undef,
  $sys_schedule = 'always',
) {
  $defaults = {
    schedule => $sys_schedule,
  }
  if $config {
    create_resources('profile::unix::template', $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('profile::unix::templates', undef)
    if $hiera_config {
      create_resources('profile::unix::template', $hiera_config, $defaults)
    }
  }
}
