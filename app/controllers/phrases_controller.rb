class PhrasesController < ApplicationController
  # before_action :set_phrase, only: [:show, :update, :destroy]

  # skip_before_action :verify_authenticity_token

  # GET /phrases
  def index
    @phrases = Phrase.where(language_id: params[:language_id])

    render json: @phrases, except: [:created_at, :updated_at]
  end

  # GET /phrases/1
  # def show
  #   render json: @phrase
  # end

  # POST /phrases
  def create
    # @phrase = Phrase.new(phrase_params)
     @phrase = language.phrases.new(phrase_params)

    if @phrase.save
      # render json: @phrase
      render json: @phrase, status: :created, location: @phrase
    else
      render json: @phrase   
    end
  end
 

  # # PATCH/PUT /phrases/1
  # def update
  #   if @phrase.update(phrase_params)
  #     render json: @phrase
  #   else
  #     render json: @phrase.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /phrases/1
  # def destroy
  #   @phrase.destroy
  # end

  private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_phrase
  #     @phrase = Phrase.find(params[:id])
  #   end

    def phrase_params
      params.require(:phrase).permit(:english_phrase, :foreign_phrase, :language_id)
    end
end
