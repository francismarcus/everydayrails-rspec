require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  describe "#index" do
    before do
      @user = FactoryBot.create(:user)
    end

    it "reponds" do
      sign_in @user
      get :index
      expect(response).to be_success
    end
  end
end