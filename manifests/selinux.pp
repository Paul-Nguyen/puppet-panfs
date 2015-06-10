# == Class: panfs::selinux
#
class panfs::selinux inherits panfs {

  if $::osfamily == 'RedHat' {
    notify { 'Disabling selinux, panfs requires this': }
    ensure_resource('class', '::selinux', { mode => 'disabled' })
  }

}
