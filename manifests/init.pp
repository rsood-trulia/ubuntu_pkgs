class ubuntu_pkgs {

  include apt

  $pkgs = hiera_array('ubuntu_pkgs', [])

  each($ubuntu_pkgs::pkgs) |$mypkg| {
    package { $mypkg:
      ensure  => installed,
      require => Class['apt'],
    }
  }

}
