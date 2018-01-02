class ImportCsvsController < ApplicationController
  # GET /import_csvs
  # GET /import_csvs.json
  def import
    @res = {success: true}
    respond_to do |format|
      format.json { 
        render json: @res
      }
    end
  end

end
