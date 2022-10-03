class Api::Trello::ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

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

  # GET /lists
  def index
    
    lists = RestClient.get("#{BASE_URL}/boards/#{idBoard}/lists?key=#{api_key}&token=#{token}")

    lists_array = JSON.parse(lists)

    lists_array.each do |item|
      List.create(listId: item["id"], name: item["name"], board: item["idBoard"])
    end 

    # Use Etag to get the new values

    # render json:@list

  end

  # GET /lists/1
  def show
    render json: @list
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:listId, :name, :board)
    end
end
