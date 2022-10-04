class Api::Trello::CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy]

  def api_key
    ENV['API_KEY']
  end

  def token 
    ENV['TOKEN']
  end

  def idList
    ENV['ID_LIST']
  end

  def idBoard
    ENV['ID_BOARD']
  end

  BASE_URL = "https://api.trello.com/1"

  # GET /cards
  def index

    cards = RestClient.get("#{BASE_URL}/boards/#{idBoard}/cards?key=#{api_key}&token=#{token}")
    render json: cards

  end

  # GET /cards/1
  def show
    render json: @card
  end

  # POST /cards
  def create
    
    begin 
      RestClient.post "#{BASE_URL}/cards?idList=#{card_params["list"]}&key=#{api_key}&token=#{token}", {"name": card_params["name"]}
    rescue RestClient::Unauthorized, RestClient::Forbidden => err
      puts 'Access denied'
      return err.response
    rescue RestClient::ExceptionWithResponse => err
      case err.http_code
      when 301, 302, 307, 204
        err.response.follow_redirection
      else
        raise
      end
    end

  end

  # PATCH/PUT /cards/1
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.permit(:name, :list, :card=>{})
    end
end
