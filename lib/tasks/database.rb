namespace :db do
  namespace :migrate do
    desc "Perform migration up"
    task up: :app do
      Sequel.extension(:migration)
      Sequel::Migrator.run(Sequel::Model.db, "db/migrate")
      p "----------> db:migrate:up is executed"
    end

    desc "Perform migration down"
    task down: :app do
      Sequel.extension(:migration)
      Sequel::Migrator.run(Sequel::Model.db, "db/migrate", target: 0)
      p "----------> db:migrate:down is executed"
    end
  end

  desc "Perform migration up to latest migration available"
  task migrate: "db:migrate:up"

  desc "Perform db seed action"
  task seed: :app do
    Seeds.create
    p "----------> db:seed is executed"
  end
end
