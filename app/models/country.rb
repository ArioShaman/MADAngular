class Country < ApplicationRecord
  has_many :country_play_lists, dependent: :destroy
  validates :name, presence: true

  def self.get(country)
    if country.present?
      where(name: country).first
    else
      nil
    end    
  end   
end
