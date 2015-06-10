# == Class: panfs::mount
#
# panfs and the DirectFlow client setup and configuration.
#
# The following are required:
# - panfs and panfs-apps are installed. We assume they are in an existing yum
#   repository, since you'll have to grab the correct version from the panasas
#   site to suit your system.
#
# === Parameters
#
# Document parameters here.
#
# [*packagename*]
#   Alternative package name
#
# === Examples
#
#  class { 'panfs::mount': }
#
# === Authors
#
# Paul Nguyen <Paul.Nguyen@uts.edu.au>
#
# === Copyright
#
# Copyright 2013 Paul Nguyen
#
class panfs::mount inherits panfs {
#Ubuntu and deb use _netdev, not panauto

    case $panfs::callback_address_allow {
        true: {
            $mountoptions = "${panfs::mountoptions},callback-address-allow=${panfs::callback_address_allow}"
        }
        default: {
            $mountoptions = "${panfs::mountoptions}"
        }
    }

    # panfs://$realm:global /panfs panfs $mount_options 0 0
    mount { $panfs::mountpoint :
        ensure  => mounted,
        atboot  => true,
        device  => "panfs://${panfs::realm}:global",
        fstype  => 'panfs',
        options => $::panfs::mount::mountoptions,
        dump    => 0,
        pass    => 0,
        require => File[$panfs::mountpoint],
    }

    file { $panfs::mountpoint:
        ensure  => 'directory',
    }
}
