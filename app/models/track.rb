class Track < ApplicationRecord
  belongs_to :author
  validates :name, :link, :author_id, presence: true
end
