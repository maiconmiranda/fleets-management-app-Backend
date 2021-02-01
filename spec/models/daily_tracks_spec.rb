require 'rails_helper'

RSpec.describe DailyTrack, type: :model do
  subject {FactoryBot.build(:daily_track)}

  context 'validations' do
      it 'is valid with valid attributes' do
       expect(subject).to be_valid
      end

      it 'is not valid without a odometer_start' do 
          subject.odometer_start = nil
          expect(subject).to_not be_valid
      end

      it 'is not valid without a odometer_end' do 
          subject.odometer_end = nil
          expect(subject).to_not be_valid
      end
  end
end
