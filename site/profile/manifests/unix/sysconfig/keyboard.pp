class profile::unix::sysconfig::keyboard (
  $config   = undef,
) {
  if $config {
    $keyboard = $config
  }
  else {
    $keyboard = hiera_hash('profile::unix::sysconfig::keyboard', undef)
  }
  if $keyboard {
    profile::unix::sysconfig::header { 'keyboard':
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'keyboard-keytable':
      file     => 'keyboard',
      var      => 'KEYTABLE',
      val      => $keyboard['keytable'],
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'keyboard-model':
      file     => 'keyboard',
      var      => 'MODEL',
      val      => $keyboard['model'],
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'keyboard-layout':
      file     => 'keyboard',
      var      => 'LAYOUT',
      val      => $keyboard['layout'],
      schedule => $schedule,
    }
    profile::unix::sysconfig::entry { 'keyboard-keyboardtype':
      file     => 'keyboard',
      var      => 'KEYBOARDTYPE',
      val      => $keyboard['keyboardtype'],
      schedule => $schedule,
    }
  }
}
