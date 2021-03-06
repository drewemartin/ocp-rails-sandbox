class Author < ActiveRecord::Base
  has_many :posts
  has_many :comments, through: :posts

  validates :name, presence: true
  validate :name_length

  def self.trending
    hash = {}
    includes(:comments).each{|x|
      hash[x.id] = x.comments.where("comments.created_at >= ?", Time.zone.now - 7.days).count
    }
    hash = hash.sort_by {|k,v| v}.reverse!.to_h
    hash.delete_if {|k, v| v < 1 } 
    hash.map do |k,v|
        self.find(k)      
    end
  end

  def first_letter
    name[0]
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
