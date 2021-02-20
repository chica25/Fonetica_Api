class LanguagesController < ApplicationController


  # GET /languages
  def index
    @languages = Language.all

    render json: @languages, except: [:created_at, :updated_at]
  end

end
