class PhrasesController < ApplicationController

  # GET /phrases
  def index
    @phrases = Phrase.where(language_id: params[:language_id])

    render json: @phrases, except: [:created_at, :updated_at]
  end


  # POST /phrases
  def create
    # binding.pry
   @language = Language.find(params[:language_id])
   @phrase = @language.phrases.new(phrase_params)
    if @phrase.save
      render json: @phrase
    # else
    #   render json: @phrase   
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
