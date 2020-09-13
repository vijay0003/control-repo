#mod 'puppet-cron', '2.0.0',
$minute = fqdn_rand(59)
node default {
  file { '/root/README':
    ensure  => file,
    content => 'This is a readme',
    owner   => 'root',
  }
  cron { 'restart_sshd':
    command => '/bin/systemctl restart sshd',
    user    => 'root',
    minute  => $minute,
}

}
