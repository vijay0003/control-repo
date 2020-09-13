#mod 'puppet-cron', '2.0.0',
$minute = fqdn_rand(59,'ds_alertd')
$hour = fqdn_rand(23,'ds_alertd')
node default {
  file { '/root/README':
    ensure  => file,
    content => 'This is a readme',
    owner   => 'root',
  }
  cron { 'restart_sshd':
    command => '/bin/systemctl restart sshd',
    user    => 'root',
    hour    => $hour,
    minute  => $minute,
}

}
