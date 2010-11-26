# Go to http://wiki.merbivore.com/pages/init-rb
 
# Specify your dependencies in the Gemfile

use_orm :datamapper
use_test :rspec
use_template_engine :erb
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  
  # Hey PK! Switch this around to bork it!
  c[:session_store] = 'memcache'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '6056edf3d204db0bc94379f24512df0c61e51e4d'  # required for cookie session store
  c[:session_id_key] = '_borked_sessions_session_id' # cookie session id key, defaults to "_session_id"
end
 
Merb::BootLoader.before_app_loads do
  print "Starting memcached... "
  system "memcached -d -p 40101 -m 64 -c 1021"
  puts "Done"
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
  Merb::MemcacheSession.store = MemCache.new('127.0.0.1', {:namespace => "session_testing"})
end
