module Api
    class TrelloCard
        def get_cards
            cards = RestClient.get("#{ENV['BASE_URL']}/boards/#{ENV['ID_BOARD']}/cards?key=#{ENV['API_KEY']}&token=#{ENV['TOKEN']}")
            cards_data = JSON.parse(cards)
        end

        def add_card(card_params)
            # Sample API Request 'https://api.trello.com/1/cards?idList=5abbe4b7ddc1b351ef961414&key=APIKey&token=APIToken' 

            url = "#{ENV['BASE_URL']}/cards?key=#{ENV['API_KEY']}&token=#{ENV['TOKEN']}"
            payload = {idList: card_params[:idList], name: card_params[:name]}

            response = RestClient.post(url,payload)
            puts response

        end
    end
end