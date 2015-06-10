# == Class: panfs
#
# panfs and the DirectFlow client setup and configuration for Redhat variants.
#
# The following are required:
# - panfs and panfs-apps packages. We assume they are in an existing yum
#   repository you've set up, since you'll have to grab the correct version
#   from the panasas site to suit your system. These are provided in deb and
#   rpm so you should be on a SUSE/RHEL/Deb variant.
# - Puppet > 2.6.2 - relationship ordering
#
# == Firewall configuration:
# Panasas recommends the following firewall configuration:
#    /sbin/iptables -I INPUT -p tcp --dport panasas -j ACCEPT
#    /sbin/iptables -I INPUT -p udp --dport panasas -j ACCEPT
#
# == How it works:
# This module:
# - Installs the rpm/deb from your available repos
# - Configures the mountpoint /panfs - this is done beforehand as starting
#   the service would try to mount it with the options we don't want.
# - There it is at /panfs
#
#
# === Parameters
#
# [*realm*]
#   The realm is required to specify where the panasas realm can be found.
#   This can be an IP or hostname.
#
# === Examples
#
# Basic Usage:
#
#   class { 'panfs':
#     realm => 'panasasrealm.example.com',
#   }
#
# To tell it to use a certain network:
#
#   class { 'panfs':
#     realm => 'panasasrealm.example.com',
#     callback-address-allow => '1.2.3.4/24',
#   }
#
# To tell it not to use a certain network:
#
#   class { 'panfs':
#     realm                     => 'panasasrealm.example.com',
#     callback-address-disallow => '1.2.3.4/24',
#   }
#
# === TODO:
# - This currently only mounts a global realm - panasas allows us to define specific mount points. This
#   could be achieved through a define and freely declaring specific mountpoints.
#
#
# === Authors
#
# Paul Nguyen <Paul.Nguyen@uts.edu.au>
#
# === Copyright
#
# Copyright 2013 Paul Nguyen
#
class panfs (
    $realm                     = $panfs::params::realm,
    $mountoptions              = $panfs::params::mountoptions,
    $mountpoint                = $panfs::params::mountpoint,
    $packagename               = $panfs::params::packagename,
    $apps_packagename          = $panfs::params::apps_packagename,
    $callback_address_allow    = $panfs::params::callback_address_allow,
    $callback_address_disallow = $panfs::params::callback_address_disallow,
) inherits panfs::params {

    validate_string($realm)
    validate_string($mountoptions)
    validate_string($packagename)
    validate_string($apps_packagename)

    class { 'panfs::install': } ->
    class { 'panfs::mount': } ~>
    class { 'panfs::service': } ->
    Class['panfs']
}
