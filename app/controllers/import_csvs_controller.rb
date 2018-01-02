class ImportCsvsController < ApplicationController
  # GET /import_csvs
  # GET /import_csvs.json
  def import
    csv = ImportCsv.new
    csv.csv = params[:file]
    if csv.save!
      @res = {success: true}
    else
      @res = {success: false}
    end
    respond_to do |format|
      format.json { 
        render json: @res
      }
    end
  end

end
