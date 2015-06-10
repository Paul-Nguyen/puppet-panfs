# == Class: panfs::install
#
class panfs::install inherits panfs {

    package { [$panfs::packagename, $panfs::apps_packagename]:
        ensure => installed,
    }

}
