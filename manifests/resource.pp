# == Type: icinga::resource
#
# This is a defined type used to create an icinga definition file
# It can create any kind of resource that icinga understands.
#
# === Parameters
#
# [*type*]
#   The type of resource that's created
# [*icinga_config*]
#   The specific params that should be included in the resource

define icinga::resource (
  $type,
  $icinga_config  = {},
) {

  validate_string($type)
  validate_hash($icinga_config)

  concat::fragment { "icinga_${type}+${title}.cfg":
    target  => "icinga_${type}",
    content => template('icinga/resource.erb'),
  }

}
