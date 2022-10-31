module Api
    class TrelloCard
        def get_cards
            cards = RestClient.get("#{ENV['BASE_URL']}/boards/#{ENV['ID_BOARD']}/cards?key=#{ENV['API_KEY']}&token=#{ENV['TOKEN']}")
            cards_data = JSON.parse(cards)
        end

        def add_card
            # Sample API Request 'https://api.trello.com/1/cards?idList=5abbe4b7ddc1b351ef961414&key=APIKey&token=APIToken'

            RestClient.post("#{ENV['BASE_URL']}/cards?idList=#{card_params[:list]}&key=#{ENV['API_KEY']}&token=#{ENV['TOKEN']}") {
                
                | response, request, result |
                
                case response.code
                     
                when 301, 302, 307
                  response.follow_redirection
                else
                    response.return!
                end

            }

        end
    end
end