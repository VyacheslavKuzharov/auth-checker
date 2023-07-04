require "sequel/core"
require "logger"

module Config
  module DB
    module_function

    def connect
      @conn ||= Sequel.connect(
        adapter: "postgres",
        host: ENV["POSTGRES_HOST"],
        user: ENV["POSTGRES_USER"],
        database: ENV["POSTGRES_DB"],
        password: ENV["POSTGRES_PASSWORD"]
      )
    end

    def log
      @conn.loggers << Logger.new($stdout)
    end
  end
end
