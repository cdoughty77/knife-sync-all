knife-sync-all
==============

A small knife plugin to allow you to sync all or some chef repo data  a chef server.  

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


Disclaimer
==========

This has ONLY been tested against hosted chef.  Bugs may and probably do exist.  If you find a bug please feel free to contact me, or fork the repo, fix it yourself and issue a pull request.


License
=======

MIT: http://rem.mit-license.org/
