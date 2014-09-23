class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  validates :subject, presence: true
  validates :body, presence: true
  validate :body_length

  private

  def body_length
    unless body.nil?
      
      if body.length < 4
        errors.add(:body, 'must be longer than 3 characters')
      end
      
    end
  end

end
