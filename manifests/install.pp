# == Class: panfs::install
#
class panfs::install inherits panfs {

    package { [$::packagename, $::apps_packagename]:
        ensure => installed,
    }

}
