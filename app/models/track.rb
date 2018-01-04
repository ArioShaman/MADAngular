class Track < ApplicationRecord
  belongs_to :author
  validates :name, :link, :author_id, presence: true
  
  def self.get(name, author)
    if name.present?
      where(name: name, author: Author.get(author)).first
    else
      nil
    end    
  end     
end
