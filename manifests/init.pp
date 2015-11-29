# install ubuntu pkgs
class ubuntu_pkgs {

  include apt
  include stdlib

  $pkgs = hiera_array('ubuntu_pkgs', [])

  each($ubuntu_pkgs::pkgs) |$mypkg| {
    ensure_packages($mypkg, {require => Class['apt']} ) 
  }

}
