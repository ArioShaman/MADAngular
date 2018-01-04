class CountryPlayList < ApplicationRecord
  belongs_to :track
  belongs_to :country

  validates :track_id, :country_id, :year, presence: true

  scope :year, -> (year) { where(year: year) }
  default_scope { order(score: :desc) }


  def self.get(country, year)
    if country.present? && year.present?
      where(country: country, year: year)
    else
      nil
    end    
  end 
end
