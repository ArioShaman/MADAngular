class ImportCsv < ApplicationRecord
  mount_uploader :csv, CsvUploader
end
