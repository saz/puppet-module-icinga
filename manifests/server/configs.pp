# == Class: icinga1::server::configs
#
# Manages the Icinga server configuration
#
# === Authors
#
# Nedap Steppingstone <steppingstone@nedap.com>
#
# === Copyright
#
# Copyright 2012, 2013 Nedap Steppingstone.
#
class icinga1::server::configs (
  $d_icinga                   = $::icinga1::server::dir_icinga,
  $d_objects                  = $::icinga1::server::dir_objects,
  $d_modules                  = $::icinga1::server::dir_modules,
  $object_dirs                = $::icinga1::server::object_dirs,
  $d_htdocs                   = $::icinga1::server::dir_htdocs,
  $d_cgi                      = $::icinga1::server::dir_cgi,
  $d_stylesheets              = $::icinga1::server::dir_stylesheets,
  $f_htpasswd                 = $::icinga1::server::file_htpasswd,
  $f_icingacfg                = $::icinga1::server::file_icingacfg,
  $f_resourcecfg              = $::icinga1::server::file_resourcecfg,
  $f_cgicfg                   = $::icinga1::server::file_cgicfg,
  $d_icinga_plugins           = $::icinga1::server::dir_icinga_plugins,
  $d_nagios_plugins           = $::icinga1::server::dir_nagios_plugins,
  $d_icinga_eventhandlers     = $::icinga1::server::dir_icinga_eventhandlers,
  $d_icinga_cache             = $::icinga1::server::dir_icinga_cache,
  $enable_notifications       = $::icinga1::server::enable_notifications,
  $icinga_configure_webserver = $::icinga1::server::icinga_configure_webserver,
  $icinga_vhostname           = $::icinga1::server::icinga_vhostname,
  $icinga_webserver           = $::icinga1::server::icinga_webserver,
  $icinga_webserver_port      = $::icinga1::server::icinga_webserver_port,
  $d_webserver_log            = $::icinga1::server::dir_webserver_log,
  $webserver_user             = $::icinga1::server::webserver_user,
  $webserver_group            = $::icinga1::server::webserver_group,
  # following is used to configure icinga.cfg
  $icinga_logfile                              = $::icinga1::server::icinga_logfile,
  $dir_nagios_plugins_config                   = $::icinga1::server::dir_nagios_plugins_config,
  $object_cache_file                           = $::icinga1::server::object_cache_file,
  $precached_object_file                       = $::icinga1::server::precached_object_file,
  $status_file                                 = $::icinga1::server::status_file,
  $status_update_interval                      = $::icinga1::server::status_update_interval,
  $icinga_user                                 = $::icinga1::server::icinga_user,
  $icinga_group                                = $::icinga1::server::icinga_group,
  $check_external_commands                     = $::icinga1::server::check_external_commands,
  $command_check_interval                      = $::icinga1::server::command_check_interval,
  $command_file                                = $::icinga1::server::command_file,
  $external_command_buffer_slots               = $::icinga1::server::external_command_buffer_slots,
  $lock_file                                   = $::icinga1::server::lock_file,
  $temp_file                                   = $::icinga1::server::temp_file,
  $temp_path                                   = $::icinga1::server::temp_path,
  $event_broker_options                        = $::icinga1::server::event_broker_options,
  $broker_module                               = $::icinga1::server::broker_module,
  $log_rotation_method                         = $::icinga1::server::log_rotation_method,
  $log_archive_path                            = $::icinga1::server::log_archive_path,
  $use_daemon_log                              = $::icinga1::server::use_daemon_log,
  $use_syslog                                  = $::icinga1::server::use_syslog,
  $use_syslog_local_facility                   = $::icinga1::server::use_syslog_local_facility,
  $syslog_local_facility                       = $::icinga1::server::syslog_local_facility,
  $log_notifications                           = $::icinga1::server::log_notifications,
  $log_service_retries                         = $::icinga1::server::log_service_retries,
  $log_host_retries                            = $::icinga1::server::log_host_retries,
  $log_event_handlers                          = $::icinga1::server::log_event_handlers,
  $log_initial_states                          = $::icinga1::server::log_initial_states,
  $log_current_states                          = $::icinga1::server::log_current_states,
  $log_external_commands                       = $::icinga1::server::log_external_commands,
  $log_passive_checks                          = $::icinga1::server::log_passive_checks,
  $log_long_plugin_output                      = $::icinga1::server::log_long_plugin_output,
  $global_host_event_handler                   = $::icinga1::server::global_host_event_handler,
  $global_service_event_handler                = $::icinga1::server::global_service_event_handler,
  $service_inter_check_delay_method            = $::icinga1::server::service_inter_check_delay_method,
  $max_service_check_spread                    = $::icinga1::server::max_service_check_spread,
  $service_interleave_factor                   = $::icinga1::server::service_interleave_factor,
  $host_inter_check_delay_method               = $::icinga1::server::host_inter_check_delay_method,
  $max_host_check_spread                       = $::icinga1::server::max_host_check_spread,
  $max_concurrent_checks                       = $::icinga1::server::max_concurrent_checks,
  $check_result_reaper_frequency               = $::icinga1::server::check_result_reaper_frequency,
  $max_check_result_reaper_time                = $::icinga1::server::max_check_result_reaper_time,
  $check_result_path                           = $::icinga1::server::check_result_path,
  $max_check_result_file_age                   = $::icinga1::server::max_check_result_file_age,
  $max_check_result_list_items                 = $::icinga1::server::max_check_result_list_items,
  $cached_host_check_horizon                   = $::icinga1::server::cached_host_check_horizon,
  $cached_service_check_horizon                = $::icinga1::server::cached_service_check_horizon,
  $enable_predictive_host_dependency_checks    = $::icinga1::server::enable_predictive_host_dependency_checks,
  $enable_predictive_service_dependency_checks = $::icinga1::server::enable_predictive_service_dependency_checks,
  $soft_state_dependencies                     = $::icinga1::server::soft_state_dependencies,
  $time_change_threshold                       = $::icinga1::server::time_change_threshold,
  $auto_reschedule_checks                      = $::icinga1::server::auto_reschedule_checks,
  $auto_rescheduling_interval                  = $::icinga1::server::auto_rescheduling_interval,
  $auto_rescheduling_window                    = $::icinga1::server::auto_rescheduling_window,
  $sleep_time                                  = $::icinga1::server::sleep_time,
  $service_check_timeout                       = $::icinga1::server::service_check_timeout,
  $host_check_timeout                          = $::icinga1::server::host_check_timeout,
  $event_handler_timeout                       = $::icinga1::server::event_handler_timeout,
  $notification_timeout                        = $::icinga1::server::notification_timeout,
  $ocsp_timeout                                = $::icinga1::server::ocsp_timeout,
  $perfdata_timeout                            = $::icinga1::server::perfdata_timeout,
  $retain_state_information                    = $::icinga1::server::retain_state_information,
  $state_retention_file                        = $::icinga1::server::state_retention_file,
  $sync_retention_file                         = $::icinga1::server::sync_retention_file,
  $retention_update_interval                   = $::icinga1::server::retention_update_interval,
  $use_retained_program_state                  = $::icinga1::server::use_retained_program_state,
  $use_retained_scheduling_info                = $::icinga1::server::use_retained_scheduling_info,
  $retained_host_attribute_mask                = $::icinga1::server::retained_host_attribute_mask,
  $retained_service_attribute_mask             = $::icinga1::server::retained_service_attribute_mask,
  $retained_process_host_attribute_mask        = $::icinga1::server::retained_process_host_attribute_mask,
  $retained_process_service_attribute_mask     = $::icinga1::server::retained_process_service_attribute_mask,
  $retained_contact_host_attribute_mask        = $::icinga1::server::retained_contact_host_attribute_mask,
  $retained_contact_service_attribute_mask     = $::icinga1::server::retained_contact_service_attribute_mask,
  $interval_length                             = $::icinga1::server::interval_length,
  $check_for_updates                           = $::icinga1::server::check_for_updates,
  $bare_update_check                           = $::icinga1::server::bare_update_check,
  $use_aggressive_host_checking                = $::icinga1::server::use_aggressive_host_checking,
  $execute_service_checks                      = $::icinga1::server::execute_service_checks,
  $accept_passive_service_checks               = $::icinga1::server::accept_passive_service_checks,
  $execute_host_checks                         = $::icinga1::server::execute_host_checks,
  $accept_passive_host_checks                  = $::icinga1::server::accept_passive_host_checks,
  $enable_event_handlers                       = $::icinga1::server::enable_event_handlers,
  $process_performance_data                    = $::icinga1::server::process_performance_data,
  $host_perfdata_command                       = $::icinga1::server::host_perfdata_command,
  $service_perfdata_command                    = $::icinga1::server::service_perfdata_command,
  $host_perfdata_file                          = $::icinga1::server::host_perfdata_file,
  $service_perfdata_file                       = $::icinga1::server::service_perfdata_file,
  $host_perfdata_file_template                 = $::icinga1::server::host_perfdata_file_template,
  $service_perfdata_file_template              = $::icinga1::server::service_perfdata_file_template,
  $host_perfdata_file_mode                     = $::icinga1::server::host_perfdata_file_mode,
  $service_perfdata_file_mode                  = $::icinga1::server::service_perfdata_file_mode,
  $host_perfdata_file_processing_interval      = $::icinga1::server::host_perfdata_file_processing_interval,
  $service_perfdata_file_processing_interval   = $::icinga1::server::service_perfdata_file_processing_interval,
  $host_perfdata_file_processing_command       = $::icinga1::server::host_perfdata_file_processing_command,
  $service_perfdata_file_processing_command    = $::icinga1::server::service_perfdata_file_processing_command,
  $host_perfdata_process_empty_results         = $::icinga1::server::host_perfdata_process_empty_results,
  $service_perfdata_process_empty_results      = $::icinga1::server::service_perfdata_process_empty_results,
  $allow_empty_hostgroup_assignment            = $::icinga1::server::allow_empty_hostgroup_assignment,
  $obsess_over_services                        = $::icinga1::server::obsess_over_services,
  $ocsp_command                                = $::icinga1::server::ocsp_command,
  $obsess_over_hosts                           = $::icinga1::server::obsess_over_hosts,
  $ochp_command                                = $::icinga1::server::ochp_command,
  $translate_passive_host_checks               = $::icinga1::server::translate_passive_host_checks,
  $passive_host_checks_are_soft                = $::icinga1::server::passive_host_checks_are_soft,
  $check_for_orphaned_services                 = $::icinga1::server::check_for_orphaned_services,
  $check_for_orphaned_hosts                    = $::icinga1::server::check_for_orphaned_hosts,
  $service_check_timeout_state                 = $::icinga1::server::service_check_timeout_state,
  $check_service_freshness                     = $::icinga1::server::check_service_freshness,
  $service_freshness_check_interval            = $::icinga1::server::service_freshness_check_interval,
  $check_host_freshness                        = $::icinga1::server::check_host_freshness,
  $host_freshness_check_interval               = $::icinga1::server::host_freshness_check_interval,
  $additional_freshness_latency                = $::icinga1::server::additional_freshness_latency,
  $enable_flap_detection                       = $::icinga1::server::enable_flap_detection,
  $low_service_flap_threshold                  = $::icinga1::server::low_service_flap_threshold,
  $high_service_flap_threshold                 = $::icinga1::server::high_service_flap_threshold,
  $low_host_flap_threshold                     = $::icinga1::server::low_host_flap_threshold,
  $high_host_flap_threshold                    = $::icinga1::server::high_host_flap_threshold,
  $date_format                                 = $::icinga1::server::date_format,
  $p1_file                                     = $::icinga1::server::p1_file,
  $enable_embedded_perl                        = $::icinga1::server::enable_embedded_perl,
  $use_embedded_perl_implicitly                = $::icinga1::server::use_embedded_perl_implicitly,
  $stalking_event_handlers_for_hosts           = $::icinga1::server::stalking_event_handlers_for_hosts,
  $stalking_event_handlers_for_services        = $::icinga1::server::stalking_event_handlers_for_services,
  $stalking_notifications_for_hosts            = $::icinga1::server::stalking_notifications_for_hosts,
  $stalking_notifications_for_services         = $::icinga1::server::stalking_notifications_for_services,
  $illegal_object_name_chars                   = $::icinga1::server::illegal_object_name_chars,
  $illegal_macro_output_chars                  = $::icinga1::server::illegal_macro_output_chars,
  $use_regexp_matching                         = $::icinga1::server::use_regexp_matching,
  $use_true_regexp_matching                    = $::icinga1::server::use_true_regexp_matching,
  $admin_email                                 = $::icinga1::server::admin_email,
  $admin_pager                                 = $::icinga1::server::admin_pager,
  $daemon_dumps_core                           = $::icinga1::server::daemon_dumps_core,
  $use_large_installation_tweaks               = $::icinga1::server::use_large_installation_tweaks,
  $enable_environment_macros                   = $::icinga1::server::enable_environment_macros,
  $free_child_process_memory                   = $::icinga1::server::free_child_process_memory,
  $child_processes_fork_twice                  = $::icinga1::server::child_processes_fork_twice,
  $debug_level                                 = $::icinga1::server::debug_level,
  $debug_verbosity                             = $::icinga1::server::debug_verbosity,
  $debug_file                                  = $::icinga1::server::debug_file,
  $max_debug_file_size                         = $::icinga1::server::max_debug_file_size,
  # This is not deprecated in 1.9 and generates a warning in 1.10. Therefor
  # it will be undef (it originally was 0)
  $event_profiling_enabled                     = $::icinga1::server::event_profiling_enabled,

  # Following is to configure cgi.cfg
  $main_config_file                                      = $::icinga1::server::main_config_file,
  $authorization_config_file                             = $::icinga1::server::authorization_config_file,
  $standalone_installation                               = $::icinga1::server::standalone_installation,
  $physical_html_path                                    = $::icinga1::server::physical_html_path,
  $url_html_path                                         = $::icinga1::server::url_html_path,
  $url_stylesheets_path                                  = $::icinga1::server::url_stylesheets_path,
  $http_charset                                          = $::icinga1::server::http_charset,
  $show_context_help                                     = $::icinga1::server::show_context_help,
  $highlight_table_rows                                  = $::icinga1::server::highlight_table_rows,
  $use_pending_states                                    = $::icinga1::server::use_pending_states,
  $use_logging                                           = $::icinga1::server::use_logging,
  $cgi_log_file                                          = $::icinga1::server::cgi_log_file,
  $cgi_log_rotation_method                               = $::icinga1::server::cgi_log_rotation_method,
  $cgi_log_archive_path                                  = $::icinga1::server::cgi_log_archive_path,
  $enforce_comments_on_actions                           = $::icinga1::server::enforce_comments_on_actions,
  $send_ack_notifications                                = $::icinga1::server::send_ack_notifications,
  $first_day_of_week                                     = $::icinga1::server::first_day_of_week,
  $icinga_check_command                                  = $::icinga1::server::icinga_check_command,
  $use_authentication                                    = $::icinga1::server::use_authentication,
  $use_ssl_authentication                                = $::icinga1::server::use_ssl_authentication,
  $default_user_name                                     = $::icinga1::server::default_user_name,
  $authorized_for_system_information                     = $::icinga1::server::authorized_for_system_information,
  $authorized_contactgroup_for_system_information        = $::icinga1::server::authorized_contactgroup_for_system_information,
  $authorized_for_configuration_information              = $::icinga1::server::authorized_for_configuration_information,
  $authorized_contactgroup_for_configuration_information = $::icinga1::server::authorized_contactgroup_for_configuration_information,
  $authorized_for_full_command_resolution                = $::icinga1::server::authorized_for_full_command_resolution,
  $authorized_contactgroup_for_full_command_resolution   = $::icinga1::server::authorized_contactgroup_for_full_command_resolution,
  $authorized_for_system_commands                        = $::icinga1::server::authorized_for_system_commands,
  $authorized_contactgroup_for_system_commands           = $::icinga1::server::authorized_contactgroup_for_system_commands,
  $authorized_for_all_services                           = $::icinga1::server::authorized_for_all_services,
  $authorized_for_all_hosts                              = $::icinga1::server::authorized_for_all_hosts,
  $authorized_contactgroup_for_all_services              = $::icinga1::server::authorized_contactgroup_for_all_services,
  $authorized_contactgroup_for_all_hosts                 = $::icinga1::server::authorized_contactgroup_for_all_hosts,
  $authorized_for_all_service_commands                   = $::icinga1::server::authorized_for_all_service_commands,
  $authorized_for_all_host_commands                      = $::icinga1::server::authorized_for_all_host_commands,
  $authorized_contactgroup_for_all_service_commands      = $::icinga1::server::authorized_contactgroup_for_all_service_commands,
  $authorized_contactgroup_for_all_host_commands         = $::icinga1::server::authorized_contactgroup_for_all_host_commands,
  $authorized_for_read_only                              = $::icinga1::server::authorized_for_read_only,
  $authorized_contactgroup_for_read_only                 = $::icinga1::server::authorized_contactgroup_for_read_only,
  $show_all_services_host_is_authorized_for              = $::icinga1::server::show_all_services_host_is_authorized_for,
  $show_partial_hostgroups                               = $::icinga1::server::show_partial_hostgroups,
  $statusmap_background_image                            = $::icinga1::server::statusmap_background_image,
  $color_transparency_index_r                            = $::icinga1::server::color_transparency_index_r,
  $color_transparency_index_g                            = $::icinga1::server::color_transparency_index_g,
  $color_transparency_index_b                            = $::icinga1::server::color_transparency_index_b,
  $default_statusmap_layout                              = $::icinga1::server::default_statusmap_layout,
  $refresh_type                                          = $::icinga1::server::refresh_type,
  $default_statuswrl_layout                              = $::icinga1::server::default_statuswrl_layout,
  $persistent_ack_comments                               = $::icinga1::server::persistent_ack_comments,
  $statuswrl_include                                     = $::icinga1::server::statuswrl_include,
  $ping_syntax                                           = $::icinga1::server::ping_syntax,
  $refresh_rate                                          = $::icinga1::server::refresh_rate,
  $escape_html_tags                                      = $::icinga1::server::escape_html_tags,
  $result_limit                                          = $::icinga1::server::result_limit,
  $host_unreachable_sound                                = $::icinga1::server::host_unreachable_sound,
  $host_down_sound                                       = $::icinga1::server::host_down_sound,
  $service_critical_sound                                = $::icinga1::server::service_critical_sound,
  $service_warning_sound                                 = $::icinga1::server::service_warning_sound,
  $service_unknown_sound                                 = $::icinga1::server::service_unknown_sound,
  $normal_sound                                          = $::icinga1::server::normal_sound,
  $action_url_target                                     = $::icinga1::server::action_url_target,
  $notes_url_target                                      = $::icinga1::server::notes_url_target,
  $lock_author_names                                     = $::icinga1::server::lock_author_names,
  $default_downtime_duration                             = $::icinga1::server::default_downtime_duration,
  $set_expire_ack_by_default                             = $::icinga1::server::set_expire_ack_by_default,
  $default_expiring_acknowledgement_duration             = $::icinga1::server::default_expiring_acknowledgement_duration,
  $status_show_long_plugin_output                        = $::icinga1::server::status_show_long_plugin_output,
  $display_status_totals                                 = $::icinga1::server::display_status_totals,
  $tac_show_only_hard_state                              = $::icinga1::server::tac_show_only_hard_state,
  $extinfo_show_child_hosts                              = $::icinga1::server::extinfo_show_child_hosts,
  $suppress_maintenance_downtime                         = $::icinga1::server::suppress_maintenance_downtime,
  $show_tac_header                                       = $::icinga1::server::show_tac_header,
  $show_tac_header_pending                               = $::icinga1::server::show_tac_header_pending,
  $exclude_customvar_name                                = $::icinga1::server::exclude_customvar_name,
  $exclude_customvar_value                               = $::icinga1::server::exclude_customvar_value,
  $showlog_initial_states                                = $::icinga1::server::showlog_initial_states,
  $showlog_current_states                                = $::icinga1::server::showlog_current_states,
  $default_num_displayed_log_entries                     = $::icinga1::server::default_num_displayed_log_entries,
  $csv_delimiter                                         = $::icinga1::server::csv_delimiter,
  $csv_data_enclosure                                    = $::icinga1::server::csv_data_enclosure,
  $tab_friendly_titles                                   = $::icinga1::server::tab_friendly_titles,
  $add_notif_num_hard                                    = $::icinga1::server::add_notif_num_hard,
  $add_notif_num_soft                                    = $::icinga1::server::add_notif_num_soft,
  $enable_splunk_integration                             = $::icinga1::server::enable_splunk_integration,
  $splunk_url                                            = $::icinga1::server::splunk_url,
  $resource_file                                         = $::icinga1::server::resource_file,
  $log_file                                              = $::icinga1::server::log_file,
) {

  file { $d_icinga:
    ensure  => directory,
    mode    => '0755',
    owner   => root,
    group   => root,
    recurse => true,
    purge   => true,
    force   => true,
    notify  => Class['icinga1::server::services'],
  }

  file { $d_stylesheets:
    ensure  => directory,
    mode    => '0755',
    owner   => root,
    group   => root,
  }

  file { $f_icingacfg:
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('icinga1/server/icinga.cfg.erb'),
    notify  => Class['icinga1::server::services'],
  }

  file { $f_cgicfg:
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('icinga1/server/cgi.cfg.erb'),
    notify  => Class['icinga1::server::services'],
  }

  file { $d_objects:
    ensure  => directory,
    mode    => '0755',
    owner   => root,
    group   => root,
    recurse => true,
    purge   => true,
    force   => true,
    notify  => Class['icinga1::server::services'],
  }

  file { $d_icinga_cache:
    ensure  => directory,
    mode    => '2750',
    owner   => $icinga_user,
    group   => $webserver_group,
  }

  file { $d_modules:
    ensure  => directory,
    mode    => '0755',
    owner   => root,
    group   => root,
    recurse => true,
    purge   => true,
    force   => true,
    notify  => Class['icinga1::server::services'],
  }

  file { $d_icinga_plugins:
    ensure  => directory,
    mode    => '0755',
    owner   => root,
    group   => root,
    recurse => true,
    purge   => true,
    force   => true,
    notify  => Class['icinga1::server::services'],
  }

  # uses:
  # user1 d_nagios_plugins
  # user2 d_icinga_plugins
  # user3 d_icinga_eventhandlers
  concat::fragment { 'icinga_resourceconf_start':
    target  => $f_resourcecfg,
    content => template('icinga1/server/resource.cfg.erb'),
    order   => '01',
  }

  concat { $f_resourcecfg:
    mode    => '0600',
    owner   => $icinga_user,
    group   => root,
    notify  => Class['icinga1::server::services'],
  } # end resource.cfg file

  concat::fragment { 'icinga_htpasswd_start':
    target  => 'icinga_htpasswd',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_htpasswd':
    path    => $f_htpasswd,
    mode    => '0644',
    owner   => root,
    group   => root,
  } # end htpasswd file

  if $icinga_configure_webserver == true {

    # be aware that you have to create a link to this file in the sites-enabled
    # dir of the webserver yourself.
    file { "${d_icinga}/${icinga_vhostname}-${icinga_webserver}.conf.example":
      mode    => '0644',
      owner   => root,
      group   => root,
      content => template("icinga1/server/vhost_${icinga_webserver}.conf.erb"),
    }

  } # end webserver

  # if external commands are enabled some defaults should be changed:
  if $check_external_commands == 1 {

    if $::operatingsystem == 'Debian' {

      exec { 'dpkg-icinga-override /var/lib/icinga':
        command => "dpkg-statoverride --update --add ${icinga_user} ${icinga_group} 751 /var/lib/icinga",
        unless  => "dpkg-statoverride --list ${icinga_user} ${icinga_group} 751 /var/lib/icinga",
        path    => ['/usr/bin', '/usr/sbin'],
        notify  => Class['icinga1::server::services'],
      }

      exec { 'dpkg-icinga-override /var/lib/icinga/rw':
        command => "dpkg-statoverride --update --add ${icinga_user} ${webserver_group} 2710 /var/lib/icinga/rw",
        unless  => "dpkg-statoverride --list ${icinga_user} ${webserver_group} 2710 /var/lib/icinga/rw",
        path    => ['/usr/bin', '/usr/sbin'],
        notify  => Class['icinga1::server::services'],
      }

    } #if operating system

  } # if check external commands

  # objects files
  concat { 'icinga_command':
    path    => "${d_objects}/command.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_command_start':
    target  => 'icinga_command',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_contact':
    path    => "${d_objects}/contact.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_contact_start':
    target  => 'icinga_contact',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_contactgroup':
    path    => "${d_objects}/contactgroup.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_contactgroup_start':
    target  => 'icinga_contactgroup',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_host':
    path    => "${d_objects}/host.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_host_start':
    target  => 'icinga_host',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_hostdependency':
    path    => "${d_objects}/hostdependency.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_hostdependency_start':
    target  => 'icinga_hostdependency',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_hostescalation':
    path    => "${d_objects}/hostescalation.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_hostescalation_start':
    target  => 'icinga_hostescalation',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_hostextinfo':
    path    => "${d_objects}/hostextinfo.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_hostextinfo_start':
    target  => 'icinga_hostextinfo',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_hostgroup':
    path    => "${d_objects}/hostgroup.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_hostgroup_start':
    target  => 'icinga_hostgroup',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_module':
    path    => "${d_objects}/module.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_module_start':
    target  => 'icinga_module',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_service':
    path    => "${d_objects}/service.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_service_start':
    target  => 'icinga_service',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_servicedependency':
    path    => "${d_objects}/servicedependency.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_servicedependency_start':
    target  => 'icinga_servicedependency',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_serviceescalation':
    path    => "${d_objects}/serviceescalation.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_serviceescalation_start':
    target  => 'icinga_serviceescalation',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_serviceextinfo':
    path    => "${d_objects}/serviceextinfo.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_serviceextinfo_start':
    target  => 'icinga_serviceextinfo',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_servicegroup':
    path    => "${d_objects}/servicegroup.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_servicegroup_start':
    target  => 'icinga_servicegroup',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  concat { 'icinga_timeperiod':
    path    => "${d_objects}/timeperiod.cfg",
    mode    => '0644',
    owner   => root,
    group   => root,
    notify  => Class['icinga1::server::services'],
  }
  concat::fragment { 'icinga_timeperiod_start':
    target  => 'icinga_timeperiod',
    content => "# This file is maintained by Puppet.\n",
    order   => '01',
  }

  Icinga1::Resource <||>
  Icinga1::Resource <<||>>
}
