require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(create :user).to be_valid
  end

  it { is_expected.to have_many(:languages)}
  it { is_expected.to have_many(:abilities)}

  describe 'validations' do
    it 'is invalid without email' do
      expect(build :user, email: nil).not_to be_valid
    end
    it 'is invalid without first_name' do
      expect(build :user, first_name: nil).not_to be_valid
    end

    it 'is invalid without last_name' do
      expect(build :user, last_name: nil).not_to be_valid
    end
  end

  describe 'attributes' do
    let(:user) { build :user }

    it 'can be admin (default false)' do
      expect(user.admin).to be_falsy
    end
  end
end