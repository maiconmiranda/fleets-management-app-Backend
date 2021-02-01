require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET users#index" do
    before(:example) do
      @first_user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:user)
      get users_path
      @json_response = JSON.parse(response.body)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'contains the correct number of entries' do
      expect(@json_response.count).to eq(2)
    end

    it 'user contains expected attributes' do
      expect(@json_response.first).to include({
        'id' => @first_user.id,
        'email' => @first_user.email,
      })
    end
  end

  # describe "POST users#create" do
  #   context 'when the user is valid' do
  #     before(:example) do
  #       @user_params = FactoryBot.attributes_for(:user)
  #       post "/sign-up", params: { user: @user_params }
  #     end
  
  #     it 'returns http created' do
  #       expect(response).to have_http_status(:created)
  #     end
  
  #     it 'saves the user to the database' do
  #       expect(User.last.email).to eq(
  #         @user_params[:email]
  #       )
  #     end
  #   end

  #   context 'when user is invalid' do
  #     before(:example) do
  #     @user_params = FactoryBot.attributes_for(:user, :invalid)
  #     post "/sign-up", params: { user: @user_params }
  #     @json_response = JSON.parse(response.body)
  #     end

  #     it 'return http unprocessable entity' do
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       p response
  #     end

  #     it 'returns the correct number of errors' do
  #       expect(@json_response.count).to eq(1)
  #     end

  #     it 'errors contain the correct error message' do
  #       expect(@json_response.first).to eq("Email can't be blank")
  #     end
  #   end
  # end
end
