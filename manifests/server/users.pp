class icinga1::server::users {

  user { 'nagios':
    ensure => present,
    system => true,
  }

}
