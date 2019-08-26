require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  describe "#index" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
        @project = FactoryBot.create(:project, owner: @user)
      end

      it "adds a project" do
        project_params = FactoryBot.attributes_for(:project)
        sign_in @user
        expect {
          post :create, params: { project: project_params }
        }.to change(@user.projects, :count).by(1)
      end

      it "reponds" do
        sign_in @user
        get :show, params: { id: @project.id }
        get :index
        expect(response).to be_success
      end
    end

    context "while not authenticated" do
      it "redirects to sign in" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
