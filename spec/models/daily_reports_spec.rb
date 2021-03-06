require 'rails_helper'

RSpec.describe DailyReport, type: :model do
  subject {FactoryBot.build(:daily_report)}

  context 'validations' do
      it 'is valid with valid attributes' do
       expect(subject).to be_valid
      end

      it 'is not valid without a description' do 
          subject.description = nil
          expect(subject).to_not be_valid
      end
  end
end
