require_relative "boot"

Config::DB.connect

module AuthChecker
  class App < Roda
    plugin :hash_branches
    plugin :head
    plugin :json, classes: [Array, Hash], content_type: "application/json"
    plugin :json_parser
    plugin :all_verbs
    plugin :halt
    plugin :common_logger, $stdout

    Dir[File.expand_path("../app/api/**/*.rb", __dir__)].sort.each { |file| require file }
    Dir[File.expand_path("../app/models/*.rb", __dir__)].sort.each { |file| require file }
    Dir[File.expand_path("../app/helpers/*.rb", __dir__)].sort.each { |file| require file }

    route do |r|
      r.root do
        {message: "Application server up and running", env: ENV["RACK_ENV"]}
      end
      r.hash_branches
    end

    hash_branch("api") do |r|
      r.hash_branches("api")
    end

    hash_branch("api", "v1") do |r|
      r.hash_branches("v1")
    end
  end
end
