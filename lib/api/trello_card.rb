module Api
    class TrelloCard
        def create_list
            cards = RestClient.get("#{ENV['BASE_URL']}/boards/#{ENV['ID_BOARD']}/cards?key=#{ENV['API_KEY']}&token=#{ENV['TOKEN']}")
            cards_data = JSON.parse(cards)
        end
    end
end