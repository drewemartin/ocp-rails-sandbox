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

  context 'scopes, class methods, associations' do
    it "an instance of Author should be able to find its posts" do
      @author = FactoryGirl.build(:author)
      @post = @author.posts.build(body:'hello', subject:'hello agains')
      @author.posts.should include(@post)
    end

    it "an instance of Author should be able to find its posts" do
      @author = FactoryGirl.build(:author)
      @post = @author.posts.build(body:'hello', subject:'hello agains')
      @comment1 = @post.comments.build(body: 'this is the body')
      @comment2 = @post.comments.build(body: 'this was the body')
      @comment3 = @post.comments.build(body: 'this shall be the body')
      @author.comments.should include(@comment1)
    end

    it "an instance of Author should be able to find its posts" do
      @author = FactoryGirl.build(:author)
      @post = @author.posts.build(body:'hello', subject:'hello agains')
      @comment1 = @post.comments.build(body: 'this is the body')
      @comment2 = @post.comments.build(body: 'this was the body')
      @comment3 = @post.comments.build(body: 'this shall be the body')
      @author.comments.should include(@comment1)
    end
  end

  
end
