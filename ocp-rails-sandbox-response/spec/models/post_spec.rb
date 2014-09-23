require 'rails_helper'

describe Post do
  context 'before creations' do
    it 'should have a valid factory' do
      post = FactoryGirl.build(:post)
      expect(post).to be_valid
    end

    it 'should not have an empty subject' do
      expect(FactoryGirl.build(:post, subject: nil)).to_not be_valid
    end

    it 'should not have an empty body' do
      expect(FactoryGirl.build(:post, body: nil)).to_not be_valid
    end

    it 'should not have a body w/ less than 4 chars' do
      expect(FactoryGirl.build(:post, body: 'abc')).to_not be_valid
    end

  end

  context 'as for association' do

    it 'should belong to a user' do
      expect(FactoryGirl.create(:post)).to respond_to(:author)
    end

  end
end
