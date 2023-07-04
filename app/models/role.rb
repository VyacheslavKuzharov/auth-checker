class Role < Sequel::Model
  plugin :json_serializer

  many_to_many :users,
    right_key: :user_id,
    left_key: :role_id,
    join_table: :user_roles
end
