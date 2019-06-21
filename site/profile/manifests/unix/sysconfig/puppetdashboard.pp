class profile::unix::sysconfig::puppetdashboard (
  $config   = undef,
) {
  if $config {
    $puppetdashboard = $config
  }
  else {
    $puppetdashboard = hiera_hash('profile::unix::sysconfig::puppetdashboard', undef)
  }
  if $puppetdashboard {
    profile::unix::sysconfig::header { 'puppet-dashboard':
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'puppet-dashboard-home':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_HOME',
      val      => $puppetdashboard['home'],
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'puppet-dashboard-user':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_USER',
      val      => $puppetdashboard['user'],
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'puppet-dashboard-ruby':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_RUBY',
      val      => $puppetdashboard['ruby'],
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'puppet-dashboard-environment':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_ENVIRONMENT',
      val      => $puppetdashboard['environment'],
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'puppet-dashboard-iface':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_IFACE',
      val      => $puppetdashboard['iface'],
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'puppet-dashboard-port':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_PORT',
      val      => $puppetdashboard['port'],
      schedule => $schedule,
    }
  }
}
