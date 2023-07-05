Sequel.migration do
  up do
    alter_table(:user_roles) do
      add_index :user_id
      add_index :role_id
    end
  end

  down do
    alter_table(:user_roles) do
      drop_index :user_id
      drop_index :role_id
    end
  end
end
