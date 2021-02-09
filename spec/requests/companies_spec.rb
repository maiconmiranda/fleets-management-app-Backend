require 'rails_helper'
# create Company
RSpec.describe "Companies", type: :request do
  describe "GET companies#index" do
    before(:example) do
      @first_company = FactoryBot.create(:company)
      @second_company = FactoryBot.create(:company)
      get companies_path
      @json_response = JSON.parse(response.body)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'contains the correct number of entries' do
      expect(@json_response.count).to eq(2)
    end

    it 'company contains expected attributes' do
      expect(@json_response.first).to include({
        'id' => @first_company.id,
        'company_name' => @first_company.company_name,
        'email' => @first_company.email,
        'manager_name' => @first_company.manager_name, 
        'abn' => @first_company.abn,
        'website' => @first_company.website,
        'contact_number' => @first_company.contact_number,
        'address' => @first_company.address,
        'suburb' => @first_company.suburb,
        'state' => @first_company.state
      })
    end
  end

  describe "POST companies#create" do
    context 'when the company is valid' do
      before(:example) do
        @company_params = FactoryBot.attributes_for(:company)
        post companies_path, params: { company: @company_params }
      end
  
      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end
  
      it 'saves the company to the database' do
        expect(Company.last.company_name).to eq(
          @company_params[:company_name]
        )
      end
    end

    context 'when company is invalid' do
      before(:example) do
      @company_params = FactoryBot.attributes_for(:company, :invalid)
      post companies_path, params: { company: @company_params }
      @json_response = JSON.parse(response.body)
      end

      it 'return http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns the correct number of errors' do
        p @json_response
        expect(@json_response.count).to eq(1)
      end

      it 'errors contain the correct error message' do
        expect(@json_response.first).to eq("Company name can't be blank")
      end
    end
  end
end
