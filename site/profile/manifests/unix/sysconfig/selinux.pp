class profile::unix::sysconfig::selinux (
  $config   = undef,
) {
  if $config {
    $selinux = $config
  }
  else {
    $selinux = hiera_hash('profile::unix::sysconfig::selinux', undef)
  }
  if $selinux {
    profile::unix::sysconfig::header { 'selinux':
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'selinux-state':
      file     => 'selinux',
      var      => 'SELINUX',
      val      => $selinux['state'],
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'selinux-type':
      file     => 'selinux',
      var      => 'SELINUXTYPE',
      val      => $selinux['type'],
      schedule => $schedule,
    }
  }
}
