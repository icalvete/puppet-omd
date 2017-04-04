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


## Requires:

* Only works on Ubuntu
* [hiera](http://docs.puppetlabs.com/hiera/1/index.html)
* https://github.com/puppetlabs/puppetlabs-apt.git
* htpasswd::user from https://github.com/icalvete/puppet-htpasswd

## Authors:

Israel Calvete Talavera <icalvete@gmail.com>
