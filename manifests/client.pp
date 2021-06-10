# == Class: icinga1::client
#
# Installs all the client side stuff we need to monitor a host.
#
# === Parameters
#
# [*icinga_servers*]
#   _default_: +empty+. Setting the icingaservers is mandatory.
#
#   Icinga servers must be an array of one or more ip address(es) or hostname(s)
#   It will be used to configure what servers are allowed to talk to the nrpe
#   daemon.
#
# === Authors
#
# Nedap Stepping Stone <steppingstone@nedap.com>
#
# === Copyright
#
# Copyright 2012, 2013 Nedap Stepping Stone.
#
class icinga1::client (
  $icinga_servers = '',

  $package_libnagios_perl             = $::icinga1::client::params::package_libnagios_perl,
  $package_nagios_nrpe_server         = $::icinga1::client::params::package_nagios_nrpe_server,
  $package_nagios_plugins_basic       = $::icinga1::client::params::package_nagios_plugins_basic,
  $package_nagios_plugins_standard    = $::icinga1::client::params::package_nagios_plugins_standard,
  $package_nagios_plugins_contrib     = $::icinga1::client::params::package_nagios_plugins_contrib,
  $package_nagios_plugin_check_multi  = $::icinga1::client::params::package_nagios_plugin_check_multi,
  $service_nagios_nrpe_server         = $::icinga1::client::params::service_nagios_nrpe_server,
  $service_nagios_nrpe_server_pattern = $::icinga1::client::params::service_nagios_nrpe_server_pattern,
  $dir_nagios                         = $::icinga1::client::params::dir_nagios,
  $dir_nrpe                           = $::icinga1::client::params::dir_nrpe,
  $file_nrpe_config                   = $::icinga1::client::params::file_nrpe_config,
  $dir_nagios_lib                     = $::icinga1::client::params::dir_nagios_lib,
  $dir_nagios_plugins                 = $::icinga1::client::params::dir_nagios_plugins,

  # params below should equal ::icinga::server::params::$param
  $dir_icinga                         = $::icinga1::client::params::dir_icinga,
  $dir_objects                        = $::icinga1::client::params::dir_objects,

  $d_nrpe                 = $::icinga1::client::params::dir_nrpe,
  $f_nrpe_config          = $::icinga1::client::params::file_nrpe_config,
  $log_facility           = $::icinga1::client::params::log_facility,
  $pid_file               = $::icinga1::client::params::pid_file,
  $server_port            = $::icinga1::client::params::server_port,
  $server_address         = $::icinga1::client::params::server_address,
  $nrpe_user              = $::icinga1::client::params::nrpe_user,
  $nrpe_group             = $::icinga1::client::params::nrpe_group,
  $dont_blame_nrpe        = $::icinga1::client::params::dont_blame_nrpe,
  $command_prefix         = $::icinga1::client::params::command_prefix,
  $debug                  = $::icinga1::client::params::debug,
  $command_timeout        = $::icinga1::client::params::command_timeout,
  $connection_timeout     = $::icinga1::client::params::connection_timeout,
  $allow_weak_random_seed = $::icinga1::client::params::allow_weak_random_seed,
  $file_local_nrpe_config = $::icinga1::client::params::file_local_nrpe_config,
  $include_dir            = $::icinga1::client::params::include_dir,
) inherits icinga1::client::params {

  validate_array($icinga_servers)

  class { '::icinga1::client::packages': } ->
  class { '::icinga1::client::configs': } ->
  class { '::icinga1::client::services': } ->
  Class [ '::icinga1::client' ]

}
