prod: rake assets:precompile && rails s -b 127.0.0.1 -p 2000 -e production
dev: rails s -b 0.0.0.0 -p 3000 -e development
update: git pull && rake assets:precompile && rails restart
redis: vendor/bin/redis-server ./config/redis.conf
stop-redis: killall -15 redis-server

