Sequel.migration do
  up do
    create_table(:roles) do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      String :key, null: false
    end
  end

  down do
    drop_table(:roles)
  end
end
