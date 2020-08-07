require 'rails_helper'

RSpec.describe "Users", type: :request do
  context 'GET #index' do 
    it 'returns a success response' do 
      get users_path 
      expect(response).to be_successful   # response.success?
    end

    context 'GET #show' do 
      it 'returns a success response' do 
        user = User.create!(first_name: 'First', last_name: 'Last', email: 'test@example.com')
        get "/users/", params: { id: user.to_param }
        # expect(response).to be_successful
        expect(response).to be_successful
      end
    end
  end
end
