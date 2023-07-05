module AuthChecker
  class App
    hash_branch("v1", "users") do |r|
      # GET /api/v1/users/:uuid
      r.get String do |user_id|
        user = User[user_id]
        r.halt(404, [{error: "user with id: #{user_id}, not found!"}]) unless user

        JsonResponse.render(roles: user.roles.map(&:key))
      end

      # GET /api/v1/users/role/:key?page=1&limit=2
      r.get "role", String do |key|
        role = Role.where(key: key).first
        r.halt(404, [{error: "role with key: #{key}, not found!"}]) unless role

        paginate = Pagination.new(page: r.params["page"], limit: r.params["limit"])

        users = User.select_all(:users)
          .join(:user_roles, user_id: :id)
          .where(role_id: role.id)
          .limit(paginate.per_page)
          .offset(paginate.offset)
          .to_a

        JsonResponse.render(users: users, total: users.size, page: paginate.page_no)
      end
    end
  end
end
