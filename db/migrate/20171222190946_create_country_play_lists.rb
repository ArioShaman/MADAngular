class CreateCountryPlayLists < ActiveRecord::Migration[5.1]
  def change
    create_table :country_play_lists do |t|
      t.belongs_to :track, null: false
      t.integer :score, default: 0
      t.belongs_to :country, null: false
      t.string :year, null: false
      t.timestamps
    end
  end
end
