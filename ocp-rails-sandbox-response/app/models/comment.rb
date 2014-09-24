class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author

  validates :body, presence: true
  validate :body_length

  scope :range, -> { where('created_at >= :seven_days_ago ',:seven_days_ago  => DateTime.now - 7.days) }

  private

  def body_length
    unless body.nil?

      if body.length < 5
        errors.add(:body, 'must be less than 300 character')
      end

    end
  end
end

