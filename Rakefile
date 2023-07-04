# type rake -T for rake tasks list
task :app do
  require_relative "./system/app"
  require_relative "./db/seeds"
end

Dir[File.dirname(__FILE__) + "/lib/tasks/*.rb"].sort.each do |path|
  require path
end
