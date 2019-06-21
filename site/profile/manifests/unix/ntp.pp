class profile::unix::ntp (
  $config   = undef,
  $sys_schedule = 'always',
) {
  if $config {
    if $config['servers'] {
      class { '::ntp':
        servers => $config['servers'],
        iburst  => $config['iburst'],
      }
    }
    elsif $config['country'] {
      class { '::ntp':
        country => $config['country'],
        iburst  => $config['iburst'],
      }
    }
    elsif $config['continent'] {
      class { '::ntp':
        continent => $config['continent'],
        iburst    => $config['iburst'],
      }
    }
    else {
      class { '::ntp': }
    }
  }
  else {
    $servers   = hiera('profile::unix::ntp::servers',   undef)
    $country   = hiera('profile::unix::ntp::country',   undef)
    $continent = hiera('profile::unix::ntp::continent', undef)
    $iburst    = hiera('profile::unix::ntp::iburst',    true)
    if $servers {
      class { '::ntp':
        servers => $servers,
        iburst  => $iburst,
      }
    }
    elsif $country {
      class { '::ntp':
        country => $country,
        iburst  => $iburst,
      }
    }
    elsif $continent {
      class { '::ntp':
        continent => $continent,
        iburst    => $iburst,
      }
    }
    else {
      include '::ntp'
    }
  }
}
