# geonode

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with geonode](#setup)
    * [What geonode affects](#what-geonode-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with geonode](#beginning-with-geonode)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

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

### Beginning with panfs

```
panfs { realm => 'blah.example.com' }
```
or use IP:
```
panfs { realm => '192.168.1.50' }
```

## Usage


## Reference


## Limitations

Tested on Centos6.
Requires an RPM or DEB of panfs and panfs-apps to be available in a source repository somewhere.

## Development

Fork away!

## Release Notes


