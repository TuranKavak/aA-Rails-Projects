require 'rails_helper'

RSpec.describe "Subs", type: :request do
  describe "GET /subs" do
    it "works! (now write some real specs)" do
      get subs_path
      expect(response).to have_http_status(200)
    end
  end
end
