class omd::install (

  $labs_edition = false

) inherits roles {

  apt::source { 'omd_consol_labs':
    comment  => 'This is the ConSol Labs Debian mirror',
    location => "http://labs.consol.de/repo/stable/${omd::params::os}",
    release  => $::lsbdistcodename,
    repos    => 'main',
    key      => {
      'id'     => 'F8C1CA08A57B9ED7',
      'server' => 'keyserver.ubuntu.com',
    },
    include  => {
      'deb' => true,
    }
  }

  if $labs_edition {
    $omd_package = 'omd-labs-edition'
  } else {
    $omd_package = 'omd'
  }

  package { $omd_package:
    ensure  => present,
    require => Apt::Source['omd_consol_labs']
  }
}
