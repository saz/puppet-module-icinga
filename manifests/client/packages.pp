# == Class: icinga1::client::packages
#
# Installs all the client side stuff we need to monitor a host.
#
# === Authors
#
# Nedap Steppingstone <steppingstone@nedap.com>
#
# === Copyright
#
# Copyright 2012, 2013 Nedap Steppingstone.
#
class icinga1::client::packages (
  $p_libnagios_perl            = $::icinga1::client::package_libnagios_perl,
  $p_nagios_nrpe_server        = $::icinga1::client::package_nagios_nrpe_server,
  $p_nagios_plugins_basic      = $::icinga1::client::package_nagios_plugins_basic,
  $p_nagios_plugins_standard   = $::icinga1::client::package_nagios_plugins_standard,
  $p_nagios_plugins_contrib    = $::icinga1::client::package_nagios_plugins_contrib,
  $p_nagios_plugin_check_multi = $::icinga1::client::package_nagios_plugin_check_multi,
) {

  package { $p_nagios_nrpe_server:
    ensure => latest,
    notify => Class['icinga1::client::services'],
  }

  package { [
    $p_libnagios_perl,
    $p_nagios_plugins_basic,
    $p_nagios_plugins_standard,
    $p_nagios_plugins_contrib,
    $p_nagios_plugin_check_multi,
  ]:
    ensure  => latest,
  }

}
