module Api
    class TrelloList
        def create_list
            lists = RestClient.get("#{ENV['BASE_URL']}/boards/#{ENV['ID_BOARD']}/lists?key=#{ENV['API_KEY']}&token=#{ENV['TOKEN']}")
            lists_data = JSON.parse(lists)
        end
    end
end
