require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  subject {FactoryBot.build(:vehicle)}

  context 'validations' do
      it 'is valid with valid attributes' do
       expect(subject).to be_valid
      end
  end
end
