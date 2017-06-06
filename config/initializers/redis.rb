APP_ROOT = File.expand_path('../../', __dir__)
system(APP_ROOT+'/vendor/bin/redis-server '+APP_ROOT+'/config/redis.conf &')
