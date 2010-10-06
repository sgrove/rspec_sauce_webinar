Webinar repo: RSpec tests cross-browser with Sauce Labs
============================================================
Follow along with the webinar video and try the examples as you watch.

Installation
------------

    git clone http://github.com/sgrove/rspec_sauce_webinar
    gem install rspec selenium-client json
        
Config
------
Add your Sauce Labs username and api-key to ondemand.yml

Optionally edit one of the browser*.yml files to specify which browsers you want to run

Run
---
You can execute each ruby file by:

    spec source/1.rb

Note that the first selenium demos are just plain ruby files. Execute them by:

    ruby source/2.rb


TODO
----
Instructions on running specs in parallel. It's a lot of fun to watch :)

Questions?
----------
Shoot me an email, I'm sean at saucelabs.com

Thanks
------
[Sauce Labs][1] (my employer and backend provider) 

License
-------
Released under MIT license

  [1]: http://saucelabs.com/
        
