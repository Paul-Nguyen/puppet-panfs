# == Class: panfs::service
#
class panfs::service inherits panfs {

    # Starting panfs starts up kernel module
    # checks NTP and then mounts the panauto mounts
    service { 'panfs':
        ensure     => running,
        enable     => true,
        hasstatus  => false,
        hasrestart => true,
    }

}
