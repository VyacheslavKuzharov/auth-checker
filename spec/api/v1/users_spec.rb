require_relative "../../../system/app"
require_relative "../../../app/api/v1/users"

RSpec.describe AuthChecker::App, roda: :app do
  describe "api/v1/users/:user_id" do
    let(:target_url) { "api/v1/users/#{user_id}" }

    context "success response" do
      let(:user) { User.first }
      let(:user_id) { user.id }

      it "renders user roles" do
        get(target_url)
        response = JSON.parse(last_response.body)

        expect(response["data"]["roles"]).to match_array(user.roles.map(&:key))
      end
    end

    context "failure response" do
      let(:user_id) { "2d494221-0664-426d-97bc-7404731e65b9" }

      it "render 404" do
        get(target_url)
        response = JSON.parse(last_response.body)

        expect(last_response.status).to eq(404)
        expect(response[0]["error"]).to eq("user with id: #{user_id}, not found!")
      end
    end
  end

  describe "api/v1/users/role/:key" do
    let(:target_url) { "api/v1/users/role/#{key}" }

    context "success response" do
      let(:key) { "author" }

      it "renders users by roles key" do
        get(target_url)
        response = JSON.parse(last_response.body)

        role = Role.where(key: key).first
        authors_users_ids = response["data"]["users"].map { |item| item["id"] }

        expect(authors_users_ids).to match_array(role.users.map(&:id))
      end
    end

    context "failure response" do
      let(:key) { "qwerty" }

      it "render 404" do
        get(target_url)
        response = JSON.parse(last_response.body)

        expect(last_response.status).to eq(404)
        expect(response[0]["error"]).to eq("role with key: #{key}, not found!")
      end
    end
  end
end
