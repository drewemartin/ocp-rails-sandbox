require 'rails_helper'
require 'spec_helper'

describe Author do

  describe "class methods" do

    it "should be able to call class methods" do
      @author = FactoryGirl.create(:author)
      @post = @author.posts.build(id: 1, body:'hello', subject:'hello agains', created_at: Time.now - 10.minutes)
      @comment1 = @post.comments.build(id: 1, body: 'this is the body', created_at: Time.now - 9.minutes)
      @comment2 = @post.comments.build(id: 2, body: 'this was the body', created_at: Time.now - 8.minutes)
      @comment3 = @post.comments.build(id: 3, body: 'this shall be the body', created_at: Time.now - 7.minutes)
      Author.last.should == @author
    end 
    #<Comment id: nil, body: "this is the body", post_id: 1, created_at: nil, updated_at: nil>
  end

  describe ".trending" do

    it "an instance of Author should be able to return trending" do
      @author = FactoryGirl.build(:author, name:'drew', created_at: Time.now - 11.years, id: 1)
      @post = @author.posts.build(id: 1, body:'hello', subject:'hello agains', created_at: Time.now - 10.years)
      @comment1 = @post.comments.build(id: 1, body: 'this is the body', created_at: Time.now - 9.years)
      @comment2 = @post.comments.build(id: 2, body: 'this was the body', created_at: Time.now - 8.years)
      @comment3 = @post.comments.build(id: 3, body: 'this shall be the body', created_at: Time.now - 7.minutes)
      Author.trending.should == @comment3
    end 
    #<Comment id: nil, body: "this is the body", post_id: 1, created_at: nil, updated_at: nil>
  end


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

  context 'associations' do
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

  end
 
end





