require 'rails_helper'

RSpec.describe Company, type: :model do
    subject {FactoryBot.build(:company)}

    context 'validations' do
        it 'is valid with valid attributes' do
         expect(subject).to be_valid
        end

        it 'is not valid without a comapny name' do 
            subject.company_name = nil
            expect(subject).to_not be_valid
        end

        it 'is not valid without a abn' do 
            subject.abn = nil
            expect(subject).to_not be_valid
        end
    end
end