module AuthChecker
  class App
    hash_branch("v1", "users") do |r|
      # GET /api/v1/users/:uuid
      r.get String do |user_id|
        JsonResponse.render(roles: user_id)
      end

      # GET /api/v1/users/role/:key
      r.get "role", String do |key|
        JsonResponse.render(keys: key)
      end
    end
  end
end
