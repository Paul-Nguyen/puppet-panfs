#== Class: panfs::params
class panfs::params {
    $realm                     = undef
    $mountoptions              = undef
    $mountpoint                = '/panfs'
    $packagename               = 'panfs'
    $apps_packagename          = 'panfs-apps'
    $callback_address_allow    = undef
    $callback_address_disallow = undef
}
