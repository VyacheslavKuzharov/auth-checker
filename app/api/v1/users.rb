module AuthChecker
  class App
    hash_branch("v1", "users") do |r|
      # GET /api/v1/users/:uuid
      r.get String do |user_id|
        user = User[user_id]
        r.halt(404, [{error: "user with id: #{user_id}, not found!"}]) unless user

        JsonResponse.render(roles: user.roles.map(&:key))
      end

      # GET /api/v1/users/role/:key
      r.get "role", String do |key|
        JsonResponse.render(keys: key)
      end
    end
  end
end
