class Api::Trello::CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy]

  # GET /cards
  def index

    @cards = Card.get_cards
    render json: @cards

  end

  # GET /cards/1
  def show

    render json: @card

  end

  # POST /cards
  def create

    # Instead of adding card to the database, save it in the Trello API
    Card.add_card(card_params)


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
      params.permit(:idList, :name)
    end

end
