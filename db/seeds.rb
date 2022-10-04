BASE_URL = "https://api.trello.com/1"

def get_lists
    
    lists = RestClient.get("#{BASE_URL}/boards/#{ENV['ID_BOARD']}/lists?key=#{ENV['API_KEY']}&token=#{ENV['TOKEN']}")

    lists_array = JSON.parse(lists)

    lists_array.each do |item|
        List.create(listId: item["id"], name: item["name"], board: item["idBoard"])
    end 

end

get_lists()

def get_cards

    cards = RestClient.get("#{BASE_URL}/boards/#{ENV['ID_BOARD']}/cards?key=#{ENV['API_KEY']}&token=#{ENV['TOKEN']}")

    cards_array = JSON.parse(cards)

    cards_array.each do |item|
        Card.create(cardId: item["id"], name: item["name"], list: item["idList"])
    end

end

get_cards()