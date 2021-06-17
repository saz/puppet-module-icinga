# == Type: icinga1::client::resources::nrpe_check
#
# This is a defined type used to store a nagios nrpe check
#
# === Parameters
#
# [*command*]
#   The specific params that should be included in the resource

define icinga1::client::resources::nrpe_check (
  $check,
  $check_name = $title,
  $dir_nrpe   = $::icinga1::client::dir_nrpe,
) {

  file { "${dir_nrpe}/${check_name}.cfg":
    mode    => '0644',
    owner   => root,
    group   => root,
    require => Class['icinga1::client::configs'],
    notify  => Class['icinga1::client::services'],
    content => "command[${check_name}]=${check}\n",
  }

}
