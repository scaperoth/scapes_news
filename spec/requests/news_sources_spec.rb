require 'rails_helper'

RSpec.describe "NewsSources", type: :request do
  describe "GET /news_sources" do
    it "works! (now write some real specs)" do
      get news_sources_path
      expect(response).to have_http_status(200)
    end
  end
end
