name             'binary-package-host'
maintainer       'Ed Tretyakov'
maintainer_email 'elhsmart@gmail.com'
license          'MIT'
description      'A Chef cookbook to setup binary package host for gentoo nodes'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1'

supports 'gentoo'

depends 'nginx'
