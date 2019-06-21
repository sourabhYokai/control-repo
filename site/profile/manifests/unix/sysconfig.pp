class profile::unix::sysconfig (
  $config   = {},
  $sys_schedule = 'always',
) {
  class { '::profile::unix::sysconfig::clock':
    config   => $config['clock'],
    schedule => $sys_schedule,
  }

  class { '::profile::unix::sysconfig::i18n':
    config   => $config['i18n'],
    schedule => $sys_schedule,
  }

  class { '::profile::unix::sysconfig::keyboard':
    config   => $config['keyboard'],
    schedule => $sys_schedule,
  }

  class { '::profile::unix::sysconfig::puppetdashboard':
    config   => $config['puppetdashboard'],
    schedule => $sys_schedule,
  }

  class { '::profile::unix::sysconfig::puppetmaster':
    config   => $config['puppetmaster'],
    schedule => $sys_schedule,
  }

  class { '::profile::unix::sysconfig::puppet':
    config   => $config['puppet'],
    schedule => $sys_schedule,
  }

  class { '::profile::unix::sysconfig::selinux':
    config   => $config['selinux'],
    schedule => $sys_schedule,
  }
}
