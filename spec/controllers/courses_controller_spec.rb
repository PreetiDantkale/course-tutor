require 'rails_helper'
require 'faker'

RSpec.describe CoursesController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns courses with tutors in JSON format" do
      course = create(:course)
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(JSON.parse([course].to_json(include: { tutors: { only: [:name, :email] } })))
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          course: attributes_for(:course)
        }
      end

      it "creates a new course" do
        expect {
          post :create,
               params: valid_params
        }.to change(Course, :count).by(1)
      end

      it "returns a success response with JSON data" do
        post :create,
             params: valid_params
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include("course", "tutors")
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) do
        {
          course: { name: "", status: "active" }
        }
      end

      it "does not create a new course" do
        expect {
          post :create,
               params: invalid_params
        }.to_not change(Course, :count)
      end

      it "returns unprocessable entity status with errors" do
        post :create,
             params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include("errors")
      end
    end
  end
end
