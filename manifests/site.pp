define omd::site (

  $ensure       = 'present',
  $password     = 'omd',
  $labs_edition = false

) {

  #class{'omd':
  #  labs_edition => $labs_edition
  #}

  validate_re($ensure, ['^present$', '^absent$'] )

  $root_site = "/opt/omd/sites/${name}/etc"

  if $ensure == 'present' {
    $omd_command = 'create'
    $omd_command_unless = "grep ${name}"
  } else {
    $omd_command = '-f rm'
    $omd_command_unless = "grep -v ${name}"
  }

  exec { "create_omd_site_${name}":
      command => "/usr/bin/omd ${omd_command} ${name}",
      user    => 'root',
      unless  =>  "/usr/bin/omd sites | ${omd_command_unless}",
      notify  => Exec["restart_omd_site_${name}"]
  }

  exec { "restart_omd_site_${name}":
      command     => '/usr/bin/omd restart',
      user        => 'root',
      refreshonly => true
  }

  if $ensure == 'present' {
    htpasswd::user {'omdadmin':
      password => $password,
      file     => "${root_site}/htpasswd",
      require  => Exec["create_omd_site_${name}"]
    }
  }
}
