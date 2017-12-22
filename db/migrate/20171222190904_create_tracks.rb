class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :cover
      t.string :link, null: false
      t.belongs_to :author 
      t.timestamps
    end
  end
end
