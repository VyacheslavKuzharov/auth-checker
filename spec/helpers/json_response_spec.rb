require_relative "../../app/helpers/json_response"

RSpec.describe JsonResponse do
  describe ".render" do
    it "render target json structure" do
      expect(JsonResponse.render(key: "value")).to eq({data: {key: "value"}})
    end
  end
end
