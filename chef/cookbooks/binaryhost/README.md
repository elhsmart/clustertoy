binary-package-host Cookbook
===================

This cookbook is designed to setup binary package host for gentoo nodes on top of nginx
Cookbook is gentoo-related and will be not useful on any other distributions
**Still work-in-progress and recommended just for educational usage**

At this moment supported only HTTP-based binary host with simple nginx virtualhost.
Be sure that this is accepted by your admin

Requirements
------------

Chef 0.10.0 or higher required (for Chef environment use).
### Platforms
* Gentoo


### Dependencies
* nginx

Attributes
----------

* `node["binary-package-host"]["http-host"]` - IP for binary host, default: `0.0.0.0`
* `node["binary-package-host"]["http-port"]` - Port to listen on, default: `8080`
* `node["binary-package-host"]["virtualhost"]` - Path to nginx host configuration file, default: `/etc/nginx/sites-available/binhost.con`
* `node["binary-package-host"]["pkgdir"]` - Path to binary packages folder, default: `/var/portage/binary`

Usage
-----
Simply include the recipe where you want Binary Package host to be set up for any Gentoo nodes

License
-------
```text
The MIT License (MIT)

Copyright (c) 2013 elhsmart

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
