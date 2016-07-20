class omd (

  $labs_edition = $false

) inherits omd::params {

  anchor {'omd::begin':
    before => Class['omd::install']
  }
  class {'omd::install':
    labs_edition => $labs_edition,
    require      => Anchor['omd::begin']
  }
  anchor {'omd::end':
    require => Class['omd::install']
  }
}
