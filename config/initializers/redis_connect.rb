require "redis"
Items = Redis.new(host: "127.0.0.1", port: 3100, db: 1)
