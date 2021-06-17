# == Class: icinga1::server::services
#
# Manages the Icinga daemon.
#
# === Authors
#
# Nedap Steppingstone <steppingstone@nedap.com>
#
# === Copyright
#
# Copyright 2012, 2013 Nedap Steppingstone.
#
class icinga1::server::services(
  String $s_icinga = $::icinga1::server::service_icinga,
){

  service { $s_icinga:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    restart    => "service ${s_icinga} reload",
    hasstatus  => true,
  }
}
