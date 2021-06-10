# == Type: icinga1::client::resources::plugin
#
# This is a defined type used to install a custom plugin into the plugindir
#
# === Parameters
#
# [*plugin_source*]
#   This tells puppet where to find the plugin


define icinga1::client::resources::plugin (
  $plugin_source,
  $dir_nagios_plugins = $::icinga1::client::dir_nagios_plugins,
) {


  file { "${dir_nagios_plugins}/${title}":
    owner   => root,
    group   => root,
    mode    => '0755',
    require => Class['icinga1::client::configs'],
    source  => $plugin_source,
  }

}
