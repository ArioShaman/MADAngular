class Country < ApplicationRecord
  has_many :country_play_lists, dependent: :destroy
  validates :name, presence: true
end
