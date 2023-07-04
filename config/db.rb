require "sequel/core"

module Config
  module DB
    def self.connect
      Sequel.connect(
        adapter: "postgres",
        host: ENV["POSTGRES_HOST"],
        user: ENV["POSTGRES_USER"],
        database: ENV["POSTGRES_DB"],
        password: ENV["POSTGRES_PASSWORD"]
      )
    end
  end
end
