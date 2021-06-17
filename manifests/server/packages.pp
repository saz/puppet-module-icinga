# == Class: icinga1::server::packages
#
# Installs the Icinga server packages.
#
# === Authors
#
# Nedap Steppingstone <steppingstone@nedap.com>
#
# === Copyright
#
# Copyright 2012, 2013 Nedap Steppingstone.
#
class icinga1::server::packages (
  $p_nagios_nrpe_plugin = $::icinga1::server::package_nrpe_plugin,
  $p_icinga             = $::icinga1::server::package_icinga,
  $p_icinga_cgi         = $::icinga1::server::package_icinga_cgi,
  $p_icinga_doc         = $::icinga1::server::package_icinga_doc,
  $p_nagios_images      = $::icinga1::server::package_nagios_images,
  $p_libjs_jquery_ui    = $::icinga1::server::package_libjs_jquery_ui,
) {

  package { $p_nagios_nrpe_plugin:
    ensure  => latest,
  }

  package { $p_nagios_images:
    ensure  => latest,
  }

  package { [
    $p_icinga,
    $p_icinga_cgi,
    $p_icinga_doc,
    $p_libjs_jquery_ui,
  ]:
    ensure  => latest,
    notify  => Class['icinga1::server::services'],
  }

}
