class PhrasesController < ApplicationController

  # GET /phrases
  def index
    phrases = Phrase.where(language_id: params[:language_id])

    render json: phrases, except: [:created_at, :updated_at]
  end


  # POST /phrases
  def create
   language = Language.find(params[:language_id])
   phrase = language.phrases.new(phrase_params)
    if phrase.save
      render json: phrase
    end
  end


  private

    def phrase_params
      params.require(:phrase).permit(:english_phrase, :foreign_phrase, :language_id)
    end
end
