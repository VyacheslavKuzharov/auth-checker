class User < Sequel::Model
  plugin :json_serializer

  many_to_many :roles,
    left_key: :user_id,
    right_key: :role_id,
    join_table: :user_roles
end
