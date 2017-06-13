# puppet-omd

Puppet manifest to install and configure OMD (The Open Monitoring Distribution)

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-omd.png)](http://travis-ci.org/icalvete/puppet-omd)

See [OMD site](http://omdistro.org/)

## Example:

```puppet
omd::site { 'site1':
  password => hiera('omd_password')
}

omd::site { 'site2':
  password => 'mypass'
}
```

Its posible install the [consol labs version](https://labs.consol.de/omd/index.html).

```puppet
class {'omd':
  labs_edition = true
}

omd::site { 'site1':
  password => 'mypass',
  require  => Class['omd']
}
```

To setup the original welcome


## Changed Default Settings for OMD-Labs
OMD-Labs changes some default settings to get the most out of OMD. If you upgrade from an existing OMD installation, your settings will not be touched and you have to manually change those settings if you want to.

### Naemon Core
Naemon replaces Nagios as default core in OMD-Labs.

To revert to the original setting, run:

```
omd config set CORE nagios
```

### Apache SSL/TLS Mode
OMD-Labs comes with enabled SSL/TLS Apache by default.

To revert to the original setting, run:

```
omd config set APACHE_MODE own
```

### Thruk as Default Web UI
Thruk is the default web ui in OMD-Labs.

To revert to the original setting, run:

```
omd config set DEFAULT_GUI welcome
omd config set THRUK_COOKIE_AUTH off
```

## Requires:

* Only works on Ubuntu
* [hiera](http://docs.puppetlabs.com/hiera/1/index.html)
* https://github.com/puppetlabs/puppetlabs-apt.git
* htpasswd::user from https://github.com/icalvete/puppet-htpasswd

## Authors:

Israel Calvete Talavera <icalvete@gmail.com>
