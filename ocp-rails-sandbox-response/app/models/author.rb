class Author < ActiveRecord::Base
  has_many :posts
  has_many :comments, through: :posts

  validates :name, presence: true
  validate :name_length

  def self.trending
    hash = {}
    all.each{|x|
      hash[x.id] = x.comments.where("comments.created_at >= ?", Time.zone.now - 7.days).count
    }
    new_hash = hash.sort_by {|k,v| v}.reverse!
    new_hash.to_h.delete_if {|k, v| v < 1 } 
    new_hash.to_h.map do |k,v,|
      if v > 0
        self.find(k)
      end
    end
  end

  private

  def name_length
    unless name.nil?
      
      if name.length < 2
        errors.add(:name, 'must be longer than 1 character')
      end
      
    end
  end

end
