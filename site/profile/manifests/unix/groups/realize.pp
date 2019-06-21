class profile::unix::groups::realize (
  $groups   = undef,
  $sys_schedule = 'always',
) {
  if $groups {
    realize(Group[$groups])
  }
  else {
    $hiera_groups = hiera_array('profile::unix::groups::realize', undef)
    if $hiera_groups {
      realize(Group[$hiera_groups])
    }
  }
}
