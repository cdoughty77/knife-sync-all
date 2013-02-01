knife-sync-all
==============

A small knife plugin to allow you to easily sync all or some chef repo data to a chef server.  

This can be integrated into a workflow such as being kicked off after an automated test set runs against your chef repository.

Or, you could use this just to test pushing some or all of your recipes, cookbooks, databags, environments and nodes to chef.

Usage
=====

<pre>
$ knife sync-all --help
knife sync-all
...
    -a, --all                        Update all roles, environments, nodes, databags and cookbooks
    -c, --cookbooks                  Update only cookbooks
    -D, --databags                   Update only databags
    -e, --environments               Update only environments
    -n, --nodes                      Update only nodes
    -r, --roles                      Update only roles
...
</pre>

Installation
============

Simply copy the sync-all.rb [script to your .chef/plugins/knife/ folder](http://wiki.opscode.com/display/chef/Knife+Plugins).

How it works
============

Basically this plugin just piggy backs on existing knife commands. To use this, first you must validate these work for your knife instance:
<pre>
knife cookbook upload all
knife role from file &lt;filename>
knife environment from file &lt;filename>
knife node from file &lt;filename>
knife data bag from file &lt;bag dir> &lt;bag filename>
</pre>

Disclaimer
==========

This has ONLY been tested against hosted chef.  Bugs may and probably do exist.  If you find a bug or want a feature, please feel free to contact me or fork the repo, fix it yourself and issue a pull request.

License
=======

MIT

Copyright (C) 2013 Chris Doughty cdoughty77@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
