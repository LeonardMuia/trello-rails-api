module Api
    class TrelloCard
        def get_card
            cards = RestClient.get("#{ENV['BASE_URL']}/boards/#{ENV['ID_BOARD']}/cards?key=#{ENV['API_KEY']}&token=#{ENV['TOKEN']}")
            cards_data = JSON.parse(cards)
        end

        def add_card
            # card = RestClient.post("#{ENV['BASE_URL']}/cards?")

            # if @list.save
            #     render json: @list, status: :created, location: @list
            # else
            #     render json: @list.errors, status: :unprocessable_entity
            # end
        end
    end
end