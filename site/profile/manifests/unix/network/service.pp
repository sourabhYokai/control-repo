class profile::unix::network::service {
  service { 'network':
    ensure => 'running',
    enable => true,
  }
}
