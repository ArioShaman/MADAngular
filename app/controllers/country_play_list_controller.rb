class CountryPlayListController < ApplicationController
  before_action :set_country_playlist, only: [:show]

  # GET /countries
  # GET /countries.json
  def index
    @playlists = CountryPlayList.all
  end

  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_playlist
      @country = CountryPlayList.find(params[:id])
    end
end
