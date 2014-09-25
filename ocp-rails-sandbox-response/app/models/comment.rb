class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author

  validates :body, presence: true
  validate :body_length

  private

  def body_length
    unless body.nil?

      if body.length < 5
        errors.add(:body, 'must be more than fout characters')
      end

    end
  end
end

