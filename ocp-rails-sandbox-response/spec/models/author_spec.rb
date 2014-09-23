require 'rails_helper'

describe Author do
  context 'before creations' do
    it 'should have a valid factory' do
      author = FactoryGirl.build(:author)
      expect(author).to be_valid
    end

    it 'should not have an empty name' do
      expect(FactoryGirl.build(:author, name:nil)).to_not be_valid
    end

    it 'should not have a name w/ less than 2 chars' do
      expect(FactoryGirl.build(:author, name:'g')).to_not be_valid
    end

  end

  
end
