require 'stripe_mock'
require 'rails_helper'

RSpec.describe V1::ProjectsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Project. As you add validations to Project, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for :project
  }

  let(:invalid_attributes) {
    attributes_for :invalid_project
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:stripe_helper) { StripeMock.create_test_helper }
  before { StripeMock.start }
  after { StripeMock.stop }

  before :each do
    @resource = create :creative

    @auth_headers = @resource.create_new_auth_token

    sign_in @resource
  end

  describe "GET #index" do
    it "assigns all projects as @projects" do
      project = Project.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe "GET #show" do
    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :show, {:id => project.to_param}, valid_session
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, {:project => valid_attributes}, valid_session
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, {:project => valid_attributes}, valid_session
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:project)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        post :create, {:project => invalid_attributes}, valid_session
        expect(assigns(:project)).to be_a_new(Project)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for :project
      }

      it "updates the requested project" do
        project = Project.create! valid_attributes
        @resource.projects << project
        put :update, {:id => project.to_param, :project => new_attributes}, valid_session
        project.reload
        expect(project.title).to eq new_attributes[:title]
      end

      it "assigns the requested project as @project" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => valid_attributes}, valid_session
        expect(assigns(:project)).to eq(project)
      end
    end

    context "with invalid params" do
      it "assigns the project as @project" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => invalid_attributes}, valid_session
        expect(assigns(:project)).to eq(project)
      end
    end

    context "without authorisation" do
      it "denies access" do
        project = Project.create! valid_attributes
        sign_in create(:creative)
        put :update, {:id => project.to_param, :project => valid_attributes}, valid_session
        expect(response).to have_http_status :unauthorized
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested project" do
      project = Project.create! valid_attributes
      @resource.projects << project
      expect {
        delete :destroy, {:id => project.to_param}, valid_session
      }.to change(Project, :count).by(-1)
    end
    context "without authorisation" do
      it "denies access" do
        project = Project.create! valid_attributes
        sign_in create(:creative)
        delete :destroy, {:id => project.to_param}, valid_session
        expect(response).to have_http_status :unauthorized
      end
    end
  end

end
