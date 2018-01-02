class ImportCsvsController < ApplicationController
  # GET /import_csvs
  # GET /import_csvs.json
  def import
    csv = ImportCsv.new
    begin   
      csv.csv = params[:file]
      if csv.save!
        @res = {success: true}
      end
    rescue Exception
      puts "#{csv.errors}"
      @res = {success: false, errors: csv.errors}
    end  
    respond_to do |format|
      format.json { 
        render json: @res
      }
    end       
  end

end
