require 'rails_helper'

RSpec.describe DailyTrack, type: :model do
  subject {FactoryBot.build(:daily_track)}

  context 'validations' do
      it 'is valid with valid attributes' do
       expect(subject).to be_valid
      end
  end
end
