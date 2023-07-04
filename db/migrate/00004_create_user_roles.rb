Sequel.migration do
  change do
    create_table(:user_roles) do
      primary_key :id, unique: true
      foreign_key :user_id, :users, null: false, type: "uuid"
      foreign_key :role_id, :roles, null: false, type: "uuid"
    end
  end
end
