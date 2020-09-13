node default {
  file { '/root/README':
    ensure  => file,
    content => 'This is a readme',
    owner   => 'root',
  }
  $minute = fqdn_rand(9)
  cron { 'restart_sshd':
    command => '/bin/systemctl restart sshd',
    user    => 'root',
    minute  => $minute,
}
