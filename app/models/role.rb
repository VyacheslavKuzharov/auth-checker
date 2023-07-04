class Role < Sequel::Model
  plugin :json_serializer

  one_to_many :user_roles
end
