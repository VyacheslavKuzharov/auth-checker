class Seeds
  class << self
    def create
      return if User.any?
      return if Role.any?

      users = create_users
      roles = create_roles

      users.each do |user|
        UserRole.create(user_id: user.id, role_id: roles.sample.id)
      end
    end

    private

    def create_users
      [].tap do |ary|
        ary << User.create(email: "example1@test.com", active: true)
        ary << User.create(email: "example2@test.com", active: true)
        ary << User.create(email: "example3@test.com", active: true)
        ary << User.create(email: "example@test.com", active: false)
        ary << User.create(email: "example@test.com", active: false)
      end
    end

    def create_roles
      [].tap do |ary|
        ary << Role.create(key: "admin")
        ary << Role.create(key: "moderator")
        ary << Role.create(key: "editor")
        ary << Role.create(key: "author")
      end
    end
  end
end
