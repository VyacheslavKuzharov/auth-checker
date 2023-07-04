class JsonResponse
  class << self
    def render(**payload)
      {
        data: payload
      }
    end
  end
end
