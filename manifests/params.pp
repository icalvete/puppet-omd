class omd::params {
  
  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $os = downcase($::operatingsystem)
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
