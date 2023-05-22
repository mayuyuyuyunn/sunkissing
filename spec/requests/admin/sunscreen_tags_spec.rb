require 'rails_helper'

RSpec.describe "Admin::SunscreenTags", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/admin/sunscreen_tags/new"
      expect(response).to have_http_status(:success)
    end
  end

end
