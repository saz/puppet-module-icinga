# == Class: icinga1::client::configs
#
# Creates directories and drops configuration files to
# monitor a host.
#
# === Authors
#
# Nedap Steppingstone <steppingstone@nedap.com>
#
# === Copyright
#
# Copyright 2012, 2013 Nedap Steppingstone.
#
class icinga1::client::configs (
  $icinga_servers          = $::icinga1::client::icinga_servers,
  $d_nrpe                  = $::icinga1::client::dir_nrpe,
  $f_nrpe_config           = $::icinga1::client::file_nrpe_config,
  $f_local_nrpe_config     = $::icinga1::client::file_local_nrpe_config,
  $log_facility            = $::icinga1::client::log_facility,
  $pid_file                = $::icinga1::client::pid_file,
  $server_port             = $::icinga1::client::server_port,
  $server_address          = $::icinga1::client::server_address,
  $nrpe_user               = $::icinga1::client::nrpe_user,
  $nrpe_group              = $::icinga1::client::nrpe_group,
  $dont_blame_nrpe         = $::icinga1::client::dont_blame_nrpe,
  $command_prefix          = $::icinga1::client::command_prefix,
  $debug                   = $::icinga1::client::debug,
  $command_timeout         = $::icinga1::client::command_timeout,
  $connection_timeout      = $::icinga1::client::connection_timeout,
  $allow_weak_random_seed  = $::icinga1::client::allow_weak_random_seed,
  $f_local_nrpe_config     = $::icinga1::client::file_local_nrpe_config,
  $include_dir             = $::icinga1::client::include_dir,
) {

  file { $f_nrpe_config:
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('icinga1/client/nrpe.cfg.erb'),
    notify  => Class['icinga1::client::services'],
  }

  file { $f_local_nrpe_config:
    ensure  => present,
    mode    => '0644',
    owner   => root,
    group   => root,
  }

  file { $d_nrpe:
    ensure  => directory,
    mode    => '0755',
    owner   => root,
    group   => root,
    force   => true,
    purge   => true,
    recurse => true,
    notify  => Class['icinga1::client::services'],
  }

}
