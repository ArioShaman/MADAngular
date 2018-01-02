class CreateImportCsvs < ActiveRecord::Migration[5.1]
  def change
    create_table :import_csvs do |t|
      t.string :csv
      t.timestamps
    end
  end
end
