dynect
======

v1.0.9 (2015-02-18)
-------------------
- Reverting chef_gem compile_time work

v1.0.8 (2015-02-18)
-------------------
- Fixing chef_gem with Chef::Resource::ChefGem.method_defined?(:compile_time)

v1.0.7 (2015-02-18)
-------------------
- Fixing chef_gem for Chef below 12.1.0

v1.0.6 (2015-02-17)
-------------------
- Being explicit about usage of the chef_gem's compile_time property.
- Eliminating future deprecation warnings in Chef 12.1.0.

v1.0.4
------
- [COOK-2382]: dynect: foodcritic style change

v1.0.2
------
- [COOK-2381] - dynect: /etc/hosts entry does not get updated on
  Amazon Linux due to regex mismatch

v1.0.0
------
- [COOK-1958] - use `chef_gem` for runtime gem requirement
