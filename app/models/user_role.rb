class UserRole < Sequel::Model
  plugin :json_serializer

  many_to_one :role
  many_to_one :item
end
