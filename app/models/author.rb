class Author < ApplicationRecord
  has_many :tracks, dependent: :destroy
  validates :name, presence: true 
   
  def self.get(author)
    if author.present?
      where(name: author).first
    else
      nil
    end    
  end  
end
