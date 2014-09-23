class Author < ActiveRecord::Base
  has_many :posts
  has_many :comments, through: :posts

  validates :name, presence: true
  validate :name_length

  private

  def name_length
    unless name.nil?
      
      if name.length < 2
        errors.add(:name, 'must be longer than 1 character')
      end
      
    end
  end

end
