require 'csv'

class CsvImportService
  def initialize(params)
    @csv_path = params[:path]
  end

  def upload
    playlist = humanize_csv @csv_path 
    puts "#{Country.first()}"

    # csv_text = File.read(csv.csv.path)
    # csv = CSV.parse(csv_text, :headers => true)
    # csv.each do |row|
    #   track = Track.get(row[1], row[0])
    #   if !track 
    #     author = Author.get(row[0])
    #     author = author ? author : Author.create(name: row[0])
    #     track = Track.create(name: row[1], cover: row[2],
    #       link: row[3], author: author) 
    #   end
    #   country = Country.get(row[4])
    #   country = country ? country : Country.create(name: row[4]) 
    #   playlist = CountryPlayList.get()
    # end    
  end

  private
    def humanize_csv(path)
      csv_text = File.read(path)
      csv = CSV.parse(csv_text, :headers => false)
      countries = []
      csv.map{|key| countries << key[4]}
      playlist = {}
      countries.uniq.each do |country|
        years = []
        fields = csv.find_all {|row| row[4] == country}
        fields.map{|key| years << key[5]}
        yearlist = {}
        years.each do |year|
          yearlist[year] = fields.find_all {|row| row[5] == year}
        end
        playlist[country] = yearlist
      end
      playlist
    end
end