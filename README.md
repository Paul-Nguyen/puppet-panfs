# panfs

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What panfs affects](#what-panfs-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with panfs](#beginning-with-panfs)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development](#development)

## Overview

This puppet module installs and mounts the panfs kernel module for Panasas systems.

## Module Description

Typically this is setup up locally via the config_panfs script, but the options aren't obvious and
you should be able to define networks and mountpoints instead of going off and fixing the config 
script's problems later.

## Setup

### What panfs affects

* fstab configuration for mountpoint (defaults to /panfs)
* kernel module and service for panfs
* It will create the mountpoint for you (not recursively though)

### Beginning with panfs

```
panfs { realm => 'blah.example.com' }
```
or use IP:
```
panfs { realm => '192.168.1.50' }
```

## Usage
```
panfs { realm => '192.168.1.50',
mountpoint => '/blah',
}
```
Mounts global scope at /blah instead.


## Reference


## Limitations

Tested on Centos6.
Requires an RPM or DEB of panfs and panfs-apps to be available in a source repository somewhere.
Requires firewall rules - see the panfs documentation for which ports.

## Development

Fork away!

## Release Notes


