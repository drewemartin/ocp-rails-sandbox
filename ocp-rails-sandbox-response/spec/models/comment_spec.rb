require 'rails_helper'

describe Comment do
  context 'before creations' do
    it 'should have a valid factory' do
      comment = FactoryGirl.build(:comment)
      expect(comment).to be_valid
    end

    it 'should not have an empty body' do
      expect(FactoryGirl.build(:comment, body: nil)).to_not be_valid
    end

    it 'should not have a body with less than 5 chars' do
      expect(FactoryGirl.build(:comment, body: 'abcd')).to_not be_valid
    end

  end

  context 'as for association' do

    it 'should belong to a user' do
      expect(FactoryGirl.create(:comment)).to respond_to(:post)
    end

  end
end
