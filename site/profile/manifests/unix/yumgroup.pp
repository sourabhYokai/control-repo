# Based on http://serverfault.com/questions/127460/how-do-i-install-a-yum-package-group-with-puppet
define profile::unix::yumgroup(
  $ensure   = 'present',
  $optional = false,
  $sys_schedule = 'daily',
  $usecache = true
) {
  $pkg_types_arg = $optional ? {
    true    => '--setopt=group_package_types=optional,default,mandatory',
    default => '',
  }
  $cache = $usecache ? {
    true    => '-C',
    default => '',
  }
  case $ensure {
    'present','installed': {
      exec { "Installing ${name} yum group":
        command  => "/usr/bin/yum -y groupinstall ${pkg_types_arg} '${name}'",
        unless   => "/usr/bin/yum ${cache} grouplist 2>/dev/null | /usr/bin/perl -ne 'last if /^Available/o; next if /^\\w/o; print' | /bin/grep -qw '${name}'",
        timeout  => 600,
        schedule => $sys_schedule,
      }
    }
    'absent': {
      exec { "Removing ${name} yum group":
        command  => "/usr/bin/yum -y groupremove ${pkg_types_arg} '${name}'",
        unless   => "/usr/bin/yum ${cache} grouplist 2>/dev/null | /usr/bin/perl -ne 'last if /^Available/o; next if /^\\w/o; print' | /bin/grep -qw '${name}'",
        timeout  => 600,
        schedule => $sys_schedule,
      }
    }
    default: {
      fail('Unknown ensure value - valid values are: present, installed or absent')
    }
  }
}
