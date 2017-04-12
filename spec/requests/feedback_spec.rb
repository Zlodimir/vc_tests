require 'rails_helper'

RSpec.describe 'Feedback', type: :request do
  context 'User' do
    it "Can create new feedback with valid parameters" do
      expect do
        post "/api/feedbacks", headers: { format: :json }, params: { feedback: { email: 'test@test.test', text: 'Text' } }
      end.to change { Feedback.count }.by 1

      expect(response).to be_success
    end

    it "Can't create feedback without email" do
      expect do
        post "/api/feedbacks", headers: { format: :json }, params: { feedback: { text: 'Text' } }
      end.to change { Feedback.count }.by 0

      expect(response.status).to eq 422
    end

    it "Can't create feedback without text" do
      expect do
        post "/api/feedbacks", headers: { format: :json }, params: { feedback: { email: 'test@test.test' } }
      end.to change { Feedback.count }.by 0

      expect(response.status).to eq 422
    end

    it "can particular see feedback" do
      feedback = FactoryGirl.create(:feedback)

      get "/api/feedbacks/#{feedback.id}", headers: { format: :json }

      expect(response).to be_success
    end
  end
end
