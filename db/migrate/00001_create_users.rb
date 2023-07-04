Sequel.migration do
  up do
    run 'CREATE EXTENSION IF NOT EXISTS  "uuid-ossp"'

    create_table(:users) do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      String :email, null: false
      FalseClass :active, null: false, default: false
    end
  end

  down do
    drop_table(:users)
  end
end
